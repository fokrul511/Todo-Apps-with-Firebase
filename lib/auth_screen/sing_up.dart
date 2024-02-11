import 'package:flutter/material.dart';
import 'package:todo_apps_with_firebase/auth_screen/logIn.dart';
import 'package:todo_apps_with_firebase/data/firebase_auth.dart';
import 'package:todo_apps_with_firebase/style.dart';

class SingUpScreen extends StatefulWidget {
  final VoidCallback show;

  SingUpScreen(this.show, {super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();

  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final TextEditingController passwordConfromTEController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      setState(() {});
    });
    _focusNode2.addListener(() {
      setState(() {});
    });
    _focusNode3.addListener(() {
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
              textFormField(
                textInputType: TextInputType.text,
                contoller: passwordConfromTEController,
                focusNode: _focusNode3,
                icon: Icons.password,
                hint: 'Confrom password',
              ),
              const SizedBox(height: 10),
              account(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  onPressed: () {
                    AuthRemote().register(
                      emailTEController.text,
                      passwordTEController.text,
                      passwordConfromTEController.text,
                    );
                  },
                  child: Text(
                    'SingUp',
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
            "have an account",
            style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
          ),
          SizedBox(width: 5),
          InkWell(
            onTap: widget.show,
            child: Text(
              'LogIn',
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
              image: AssetImage('images/7.png'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
