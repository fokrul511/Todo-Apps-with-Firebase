import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_apps_with_firebase/auth_screen/auth_page.dart';
import 'package:todo_apps_with_firebase/screen/home.dart';
import 'package:todo_apps_with_firebase/widget/task_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return TaskWidget();
          }else{
            return AuthScreen();
          }
        },
      ),
    );
  }
}
