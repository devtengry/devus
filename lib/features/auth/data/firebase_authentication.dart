// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class FirebaseAuthentication {
  final FirebaseAuth _firebase = FirebaseAuth.instance;

  User? get currentUser => _firebase.currentUser;

  Stream<User?> get authStateChanges => _firebase.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _firebase.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      _showErrorSnackbar(context, _firebaseErrorToLocaleKey(e.code).tr());
    } catch (e) {
      _showErrorSnackbar(context, 'auth.unknown_error'.tr());
    }
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _firebase.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      _showErrorSnackbar(context, _firebaseErrorToLocaleKey(e.code).tr());
    } catch (e) {
      _showErrorSnackbar(context, 'auth.unknown_error'.tr());
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _firebase.signOut();
    } catch (e) {
      _showErrorSnackbar(context, 'auth.signout_error'.tr());
    }
  }

  void _showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.blueGrey,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  String _firebaseErrorToLocaleKey(String code) {
    switch (code) {
      case 'invalid-email':
        return 'auth.invalid_email';
      case 'user-disabled':
        return 'auth.user_disabled';
      case 'user-not-found':
        return 'auth.user_not_found';
      case 'wrong-password':
        return 'auth.wrong_password';
      case 'email-already-in-use':
        return 'auth.email_already_in_use';
      case 'operation-not-allowed':
        return 'auth.operation_not_allowed';
      case 'weak-password':
        return 'auth.weak_password';
      default:
        return 'auth.unknown_error';
    }
  }
}
