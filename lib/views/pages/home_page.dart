import 'package:chatapp/services/auth_service.dart';
import 'package:chatapp/views/pages/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout(BuildContext context) async {
    final authService = AuthService();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    await authService.signOut();

    if (context.mounted) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () => logout(context), icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
