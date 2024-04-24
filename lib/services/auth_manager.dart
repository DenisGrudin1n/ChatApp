import 'package:chatapp/services/auth_service.dart';
import 'package:chatapp/views/pages/home_page.dart';
import 'package:flutter/material.dart';

class AuthManager {
  final AuthService authService = AuthService();

  Future<String> signUp(String username, String email, String password) async {
    try {
      String res =
          await authService.signUpWithEmailPassword(username, email, password);
      return res;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> signIn(String email, String password) async {
    try {
      String res = await authService.signInWithEmailPassword(email, password);
      return res;
    } catch (e) {
      return e.toString();
    }
  }

  void navigateToHome(BuildContext context, String message, bool isSuccess) {
    Navigator.pop(context);

    if (isSuccess) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
