import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../service/firestore_service.dart';

class HomeScreen extends StatelessWidget {
  final User user;
  final FirestoreService _firestoreService = FirestoreService();

  HomeScreen({Key? key, required this.user}) : super(key: key);

  /// Obtener nombre completo desde Firestore
  Future<Map<String, String>> _getUserData() async {
    try {
      final userData = await _firestoreService.getUserByEmail(user.email ?? '');
      return {
        'full_name': userData['full_name'] ?? 'Usuario',
        'materia': userData['materia'] ?? 'Sin asignar',
        'paralelo': userData['paralelo'] ?? 'Sin asignar',
      };
    } catch (e) {
      return {
        'full_name': 'Usuario',
        'materia': 'Sin asignar',
        'paralelo': 'Sin asignar',
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    final String correo = user.email ?? 'Usuario';
    final String correoSinDominio = correo.split('@')[0];

    return Scaffold(
      body: FutureBuilder<Map<String, String>>(
        future: _getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar los datos.'));
          }

          final userData = snapshot.data ?? {
            'full_name': 'Usuario',
            'materia': 'Sin asignar',
            'paralelo': 'Sin asignar',
          };

          final String nombreCompleto = userData['full_name']!;
          final String materia = userData['materia']!;
          final String paralelo = userData['paralelo']!;

          return Stack(
            children: [
              // Fondo degradado
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 203, 26, 17), Color(0xFF2575FC)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Encabezado con el correo simplificado
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            child: Text(
                              correoSinDominio[0].toUpperCase(),
                              style: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2575FC),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Hola, $correoSinDominio',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Un gusto tenerte de vuelta',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Tarjetas de información personal
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 107, 145, 206),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              _buildInfoCard(
                                icon: Icons.person,
                                title: 'Nombre y Apellido',
                                subtitle: nombreCompleto,
                              ),
                              const SizedBox(height: 20),
                              _buildInfoCard(
                                icon: Icons.school,
                                title: 'Materia',
                                subtitle: materia,
                              ),
                              const SizedBox(height: 20),
                              _buildInfoCard(
                                icon: Icons.class_,
                                title: 'Nivel y Paralelo',
                                subtitle: paralelo,
                              ),
                              const Spacer(),
                              ElevatedButton.icon(
                                onPressed: () async {
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.pushReplacementNamed(context, '/login');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                    horizontal: 24,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                icon: const Icon(Icons.logout, color: Colors.white),
                                label: const Text(
                                  'Cerrar Sesión',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF2575FC).withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 32, color: const Color(0xFF2575FC)),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
