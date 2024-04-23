import 'package:flutter/material.dart';

class LoginOrRegisterController with ChangeNotifier {
  bool showLoginPage = true;

  void togglePages() {
    showLoginPage = !showLoginPage;
    notifyListeners();
  }
}
