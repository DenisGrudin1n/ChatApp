import 'package:chatapp/controllers/constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Login Page",
          style: TextStyle(fontSize: 18, color: kDark),
        ),
      ),
    );
  }
}
