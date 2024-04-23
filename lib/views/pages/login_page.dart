import 'package:chatapp/constants/constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: Text(
          "Login Page",
          style: TextStyle(fontSize: 18, color: kBlack),
        ),
      ),
    );
  }
}
