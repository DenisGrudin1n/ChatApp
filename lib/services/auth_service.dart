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
}
