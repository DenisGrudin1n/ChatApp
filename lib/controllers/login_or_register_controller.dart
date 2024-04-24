import 'package:chatapp/views/pages/login_page.dart';
import 'package:chatapp/views/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegisterController with ChangeNotifier {
  bool showLoginPage = true;

  void togglePages() {
    showLoginPage = !showLoginPage;
    notifyListeners();
  }

  Widget selectPage(BuildContext context) {
    final bool showLoginPage = this.showLoginPage;
    return showLoginPage ? LoginPage() : RegisterPage();
  }
}
