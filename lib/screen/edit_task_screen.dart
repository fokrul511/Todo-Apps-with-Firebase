import 'package:flutter/material.dart';
import 'package:todo_apps_with_firebase/style.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController title = TextEditingController();
  final TextEditingController discription = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  int indexx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroudColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100,),
                textFormField(
                  contoller: title,
                  hint: 'Title',
                  focusNode: focusNode1,
                ),
                subtitle(),
                SizedBox(height: 20),
                imagess(),
                SizedBox(height: 20),
                button(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row button(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(170, 48), backgroundColor: custom_green),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Add'),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(170, 48),backgroundColor: Colors.red),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              ],
            );
  }

  Container imagess() {
    return Container(
      height: 180,
      child: ListView.builder(
        itemCount: 16,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              indexx = index;
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: indexx == index ? custom_green : Colors.grey,
                  )),
              width: 140,
              margin: EdgeInsets.all(5),
              child: Column(
                children: [
                  Image.asset(
                    'images/${index}.png',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding subtitle() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextField(
        controller: discription,
        focusNode: focusNode2,
        decoration: InputDecoration(hintText: 'Subtitle'),
        maxLines: 5,
        maxLength: 120,
      ),
    );
  }
}

Widget textFormField({
  required TextEditingController contoller,
  required FocusNode focusNode,
  required String hint,
}) {
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
        ),
      ),
    ),
  );
}
