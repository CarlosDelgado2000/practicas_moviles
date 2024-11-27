import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Método para agregar datos a una colección
  Future<void> addData(String collection, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).add(data);
    } catch (e) {
      throw Exception('Error al agregar datos: $e');
    }
  }

  // Método para obtener datos en tiempo real desde una colección
  Stream<QuerySnapshot> getData(String collection) {
    try {
      return _firestore.collection(collection).snapshots();
    } catch (e) {
      throw Exception('Error al obtener datos: $e');
    }
  }

  // Método para actualizar un documento por ID
  Future<void> updateData(
      String collection, String documentId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).doc(documentId).update(data);
    } catch (e) {
      throw Exception('Error al actualizar datos: $e');
    }
  }

  // Método para eliminar un documento por ID
  Future<void> deleteData(String collection, String documentId) async {
    try {
      await _firestore.collection(collection).doc(documentId).delete();
    } catch (e) {
      throw Exception('Error al eliminar datos: $e');
    }
  }

  // Método para obtener un documento específico por ID
  Future<DocumentSnapshot> getDocumentById(
      String collection, String documentId) async {
    try {
      return await _firestore.collection(collection).doc(documentId).get();
    } catch (e) {
      throw Exception('Error al obtener el documento: $e');
    }
  }

  // Método para realizar consultas personalizadas (ejemplo: por un campo específico)
  Future<List<QueryDocumentSnapshot>> queryData(
      String collection, String field, dynamic value) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection(collection)
          .where(field, isEqualTo: value)
          .get();
      return querySnapshot.docs;
    } catch (e) {
      throw Exception('Error al consultar datos: $e');
    }
  }
}
