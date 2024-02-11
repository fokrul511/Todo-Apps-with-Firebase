import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthicationDataSoucre {
  Future<void> register(String email, String password, String confromPassword);

  Future<void> login(String email, String password);
}

bool isLoding = false;

class AuthRemote extends AuthicationDataSoucre {
  @override
  Future<void> login(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(), password: password.trim());
  }

  @override
  Future<void> register(
      String email, String password, String confromPassword) async {
    if (password == confromPassword) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    }
  }
}
