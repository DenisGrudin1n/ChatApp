import 'package:chatapp/controllers/login_or_register_controller.dart';
import 'package:chatapp/themes/themes.dart';
import 'package:chatapp/views/pages/login_page.dart';
import 'package:chatapp/views/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => LoginOrRegisterController(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bool showLoginPage =
        Provider.of<LoginOrRegisterController>(context).showLoginPage;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: showLoginPage ? LoginPage() : RegisterPage(),
      theme: lightMode,
    );
  }
}
