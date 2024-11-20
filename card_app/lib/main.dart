import 'package:flutter/material.dart';

void main() {
  runApp(const CardApp());
}

class CardApp extends StatefulWidget {
  const CardApp({Key? key}) : super(key: key);

  @override
  _CardAppState createState() => _CardAppState();
}

class _CardAppState extends State<CardApp> {
  // Controladores para los TextFields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController favoriteController = TextEditingController();
  final TextEditingController peopleController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  // Variables para almacenar los valores actualizados
  String name = 'Triki';
  String profession = 'awesome kitty';
  String favorite = 'I love tuna, ham and milk';
  String people = 'I own two people';
  String age = 'I am 2 months old';

  @override
  void dispose() {
    // Liberar los controladores
    nameController.dispose();
    professionController.dispose();
    favoriteController.dispose();
    peopleController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 39, 46, 176),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://previews.123rf.com/images/yupiramos/yupiramos1709/yupiramos170930842/87002967-ilustraci%C3%B3n-de-vector-de-dibujos-animados-de-persona-de-personaje-joven-de-hombre-de-retrato.jpg', // Cambia por tu URL
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  name,
                  style: const TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  profession,
                  style: const TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: Colors.white70,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 20, width: 150, child: Divider(color: Colors.white70)),
                // Cuadros con TextFields para modificar valores
                buildEditableCard(
                  icon: Icons.favorite,
                  label: favorite,
                  controller: favoriteController,
                  onChanged: (value) {
                    setState(() {
                      favorite = value;
                    });
                  },
                ),
                buildEditableCard(
                  icon: Icons.people,
                  label: people,
                  controller: peopleController,
                  onChanged: (value) {
                    setState(() {
                      people = value;
                    });
                  },
                ),
                buildEditableCard(
                  icon: Icons.cake,
                  label: age,
                  controller: ageController,
                  onChanged: (value) {
                    setState(() {
                      age = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                // Campos para modificar el nombre y la profesión
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: professionController,
                    decoration: InputDecoration(
                      labelText: 'Profession',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        profession = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget para crear tarjetas editables
  Widget buildEditableCard({
    required IconData icon,
    required String label,
    required TextEditingController controller,
    required Function(String) onChanged,
  }) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: ListTile(
        leading: Icon(icon, color: Colors.purple),
        title: TextField(
          controller: controller..text = label,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          style: const TextStyle(
            color: Colors.purple,
            fontFamily: 'Source Sans Pro',
            fontSize: 16,
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
