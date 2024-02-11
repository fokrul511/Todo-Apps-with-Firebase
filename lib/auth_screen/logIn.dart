import 'package:flutter/material.dart';
import 'package:todo_apps_with_firebase/style.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();

  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroudColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              image(context),
              const SizedBox(height: 20),
              textFormField(
                contoller: emailTEController,
                focusNode: _focusNode1,
                icon: Icons.email,
                hint: 'Email',
              ),
              const SizedBox(height: 10),
              textFormField(
                contoller: passwordTEController,
                focusNode: _focusNode2,
                icon: Icons.password,
                hint: 'password',
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'LogIn',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textFormField(
      {required TextEditingController contoller,
      required FocusNode focusNode,
      required IconData icon,
      required String hint}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: TextFormField(
          controller: contoller,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: hint,
            prefixIcon: Icon(
              icon,
              color: _focusNode1.hasFocus ? custom_green : Color(0xffc5c5c5),
            ),
          ),
        ),
      ),
    );
  }

  Padding image(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/7.png'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
