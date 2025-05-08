import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebase = FirebaseAuth.instance;

  User? get currentUser => _firebase.currentUser;

  Stream<User?> get authStateChanges => _firebase.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebase.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebase.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _firebase.signOut();
  }
}
