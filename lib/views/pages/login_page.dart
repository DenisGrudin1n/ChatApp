import 'package:chatapp/components/my_login_upperpart_ui.dart';
import 'package:chatapp/components/my_default_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:chatapp/constants/constants.dart';
import 'package:chatapp/services/auth/auth_manager.dart';
import 'package:chatapp/views/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  void login(BuildContext context) async {
    final authManager = AuthManager();
    authManager.showLoadingDialog(context);

    String res = await authManager.signIn(
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
          const Expanded(child: LoginUpperUI()),
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
                      height: 25,
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
                      height: 50,
                    ),
                    MyDefaultButton(
                      text: "Get Started",
                      onTap: () => login(context),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage())),
                            child: Text(
                              "Create Account",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: 14,
                                  fontWeight: mediumFontWeight),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Text(
                                "Forgot Password",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontSize: 14,
                                    fontWeight: mediumFontWeight),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
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
