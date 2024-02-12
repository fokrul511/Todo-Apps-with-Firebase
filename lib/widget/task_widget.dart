import 'package:flutter/material.dart';
import 'package:todo_apps_with_firebase/screen/edit_task_screen.dart';
import 'package:todo_apps_with_firebase/style.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Container(
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 7,
                  blurRadius: 5,
                  offset: const Offset(0, 2))
            ],
          ),
          child: Row(
            children: [
              imagee(),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Title',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Checkbox(
                          value: isDone,
                          onChanged: (value) {
                            isDone = !isDone;
                            setState(() {});
                          },
                        )
                      ],
                    ),
                    Text(
                      'Subtitle',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          edit_time(),
                          const SizedBox(
                            width: 10,
                          ),
                          edit()
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  GestureDetector edit() {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => EditScreen(),));
      },
      child: Container(
        width: 90,
        height: 28,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: const Color(0xffe2f6f1)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset("images/icon_edit.png",height: 15,),
            Icon(
              Icons.edit,
              size: 20,
              color: Colors.green,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Edit',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector edit_time() {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 90,
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: custom_green,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/icon_time.png",
              height: 15,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Time',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imagee() {
    return Container(
      height: 130,
      width: 100,
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('images/0.png'),
            fit: BoxFit.cover,
          )),
    );
  }
}
