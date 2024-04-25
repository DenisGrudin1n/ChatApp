import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // instance of auth
  final FirebaseAuth auth = FirebaseAuth.instance;

  // sign in
  Future<String> signInWithEmailPassword(String email, String password) async {
    String res = "";
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      res = "Success";
    } on FirebaseAuthException catch (e) {
      res = e.code;
    }
    return res;
  }

  // sign up
  Future<String> signUpWithEmailPassword(
      String username, String email, String password) async {
    String res = "";
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await userCredential.user?.updateDisplayName(username);
      res = "Success";
    } on FirebaseAuthException catch (e) {
      res = e.code;
    }
    return res;
  }

  // sign out
  Future<void> signOut() async {
    return await auth.signOut();
  }

  // errors

  // username validation
  String validateUsername(String username) {
    // Мінімальна та максимальна довжина імені
    const int minUsernameLength = 6;
    const int maxUsernameLength = 20;

    // Регулярний вираз для перевірки допустимих символів
    final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');

    // Перевірка на мінімальну та максимальну довжину імені
    if (username.length < minUsernameLength ||
        username.length > maxUsernameLength) {
      return 'Username must be between $minUsernameLength and $maxUsernameLength characters';
    }

    // Перевірка на допустимі символи
    if (!usernameRegex.hasMatch(username)) {
      return 'Username can only contain letters, numbers, and underscores';
    }

    // Перевірка на унікальність імені користувача (при необхідності)

    // Якщо всі перевірки пройшли успішно, повертаємо null (немає помилок)
    return "Success";
  }
}
