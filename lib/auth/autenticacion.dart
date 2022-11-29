import 'package:firebase_auth/firebase_auth.dart';

class autenticacion {
  final FirebaseAuth _fire = FirebaseAuth.instance;
  User? get usuario => _fire.currentUser;
  Stream<User?> get estadoLogin => _fire.authStateChanges();

  Future<void> inicioSesion ({required String usuarioEmail, required String passwordUser}) async {
    await _fire.signInWithEmailAndPassword(email: usuarioEmail, password: passwordUser);
  }

  Future<void> crearUsuario ({required String usuarioEmail, required String passwordUser}) async {
    await _fire.createUserWithEmailAndPassword (email: usuarioEmail, password: passwordUser);
  }

  Future<void> cerrarSesion () async {
    await _fire.signOut();
  }

}