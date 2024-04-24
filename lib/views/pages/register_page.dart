import 'package:chatapp/components/login_upper_ui.dart';
import 'package:chatapp/components/my_default_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:chatapp/constants/constants.dart';
import 'package:chatapp/services/auth_manager.dart';
import 'package:chatapp/views/pages/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegisterPage({super.key});

  void register(BuildContext context) async {
    final authManager = AuthManager();
    authManager.showLoadingDialog(context);

    String res = await authManager.signUp(
        usernameController.text, emailController.text, passwordController.text);

    if (context.mounted) {
      authManager.navigateToHome(context, res, res == "Success");
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(
            child: Text(res),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          const Expanded(
            child: LoginUpperUI(),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.background,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 30.0, top: 15),
                          child: Icon(
                            Icons.person,
                            color: lightPurple,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: MyTextField(
                            hintText: "Username",
                            obscureText: false,
                            controller: usernameController,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 30.0, top: 15),
                          child: Icon(
                            Icons.email,
                            color: lightPurple,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: MyTextField(
                            hintText: "Email",
                            obscureText: false,
                            controller: emailController,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 30.0, top: 15),
                          child: Icon(
                            Icons.lock,
                            color: lightPurple,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: MyTextField(
                            hintText: "Password",
                            obscureText: true,
                            controller: passwordController,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    MyDefaultButton(
                      text: "Create Account",
                      onTap: () => register(context),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14,
                                  fontWeight: mediumFontWeight),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage())),
                              child: Text(
                                "Log in",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontSize: 14,
                                    fontWeight: mediumFontWeight),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
