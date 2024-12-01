import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Método para agregar datos a una colección
  Future<void> addData(String collection, Map<String, dynamic> data) async {
    try {
      // Agregar un nuevo documento con un ID único
      await _firestore.collection(collection).add(data);
    } catch (e) {
      throw Exception('Error al agregar datos: $e');
    }
  }

  /// Obtener datos del usuario por correo electrónico
  Future<Map<String, dynamic>> getUserByEmail(String email) async {
    final querySnapshot = await _firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first.data();
    } else {
      throw Exception('Usuario no encontrado.');
    }
  }
}
