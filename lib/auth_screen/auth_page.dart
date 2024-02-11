import 'package:flutter/material.dart';
import 'package:todo_apps_with_firebase/auth_screen/logIn.dart';
import 'package:todo_apps_with_firebase/auth_screen/sing_up.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool a = true;

  void to() {
    a = !a;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (a) {
      return  LogInScreen(to);
    } else {
      return  SingUpScreen(to);
    }
  }
}
