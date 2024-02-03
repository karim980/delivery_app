import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/colors/app_color.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get userId => _auth.currentUser?.uid;
  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    user.bindStream(_auth.authStateChanges());
  }

  Future signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      if (_auth.currentUser?.emailVerified == false) {
        await _auth.currentUser?.sendEmailVerification();
      }
      return _auth.currentUser?.uid;
    } catch (e) {
      Get.snackbar("Error", "Authentication failed");
    }
  }

  Future signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (_auth.currentUser?.emailVerified == false) {
        await _auth.currentUser?.sendEmailVerification();
      }
      return _auth.currentUser?.uid;
    } on FirebaseAuthException catch (e) {
      print('Signup Error: $e');
      Get.snackbar("Error", "Sign up failed",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
    }
  }

  resetPassword({required String email}) async {
    await _auth
        .sendPasswordResetEmail(email: email)
        .then((value) => debugPrint('successful'))
        .catchError((e) => debugPrint('filed'));
    return null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
