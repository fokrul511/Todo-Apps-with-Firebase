import 'package:flutter/material.dart';
import 'package:todo_apps_with_firebase/auth_screen/sing_up.dart';
import 'package:todo_apps_with_firebase/data/firebase_auth.dart';
import 'package:todo_apps_with_firebase/style.dart';

class LogInScreen extends StatefulWidget {
  final VoidCallback show;

  LogInScreen(this.show, {super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();

  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      setState(() {});
    });
    _focusNode2.addListener(() {
      setState(() {});
    });
  }

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
                textInputType: TextInputType.emailAddress,
                contoller: emailTEController,
                focusNode: _focusNode1,
                icon: Icons.email,
                hint: 'Email',
              ),
              const SizedBox(height: 10),
              textFormField(
                textInputType: TextInputType.text,
                contoller: passwordTEController,
                focusNode: _focusNode2,
                icon: Icons.password,
                hint: 'password',
              ),
              const SizedBox(height: 10),
              account(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  onPressed: () {
                    AuthRemote().login(emailTEController.text, passwordTEController.text);
                  },
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

  Widget account() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "don't have an account",
            style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
          ),
          SizedBox(width: 5),
          InkWell(
            onTap: widget.show,
            child: Text(
              'Sing Up',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textFormField(
      {required TextEditingController contoller,
      required FocusNode focusNode,
      required IconData icon,
      required String hint, required TextInputType textInputType}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: TextFormField(
          keyboardType: textInputType,
          controller: contoller,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: hint,
            prefixIcon: Icon(
              icon,
              color: focusNode.hasFocus ? custom_green : Color(0xffc5c5c5),
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
              image: AssetImage('images/5.png'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
