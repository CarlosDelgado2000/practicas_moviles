import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Método para iniciar sesión
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Manejo de errores específicos de Firebase
      switch (e.code) {
        case 'user-not-found':
          throw Exception('No se encontró un usuario con este correo.');
        case 'wrong-password':
          throw Exception('Contraseña incorrecta.');
        case 'invalid-email':
          throw Exception('El correo electrónico no es válido.');
        default:
          throw Exception('Error al iniciar sesión: ${e.message}');
      }
    } catch (e) {
      // Propaga otros errores como genéricos
      throw Exception('Error inesperado: $e');
    }
  }

  // Método para registrar un nuevo usuario
  Future<User?> register(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Manejo de errores específicos de Firebase
      switch (e.code) {
        case 'email-already-in-use':
          throw Exception('Este correo ya está registrado.');
        case 'invalid-email':
          throw Exception('El correo electrónico no es válido.');
        case 'weak-password':
          throw Exception('La contraseña es demasiado débil.');
        default:
          throw Exception('Error al registrar usuario: ${e.message}');
      }
    } catch (e) {
      // Propaga otros errores como genéricos
      throw Exception('Error inesperado: $e');
    }
  }

  // Método para cerrar sesión
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('Error al cerrar sesión: $e');
    }
  }

  // Método para restablecer contraseña
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw Exception('El correo electrónico no es válido.');
        case 'user-not-found':
          throw Exception('No se encontró un usuario con este correo.');
        default:
          throw Exception('Error al enviar correo de restablecimiento: ${e.message}');
      }
    } catch (e) {
      throw Exception('Error inesperado: $e');
    }
  }

  // Método para obtener el usuario actual
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Método para verificar si un usuario está autenticado
  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }
}
