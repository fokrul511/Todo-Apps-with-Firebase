import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo_apps_with_firebase/screen/add_task_screen.dart';
import 'package:todo_apps_with_firebase/style.dart';
import 'package:todo_apps_with_firebase/widget/task_widget.dart';

enum PopUpMenuButton {
  logOut,
  teamInfo,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: custom_green,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text(
                    'Team Info',
                  ),
                  value: PopUpMenuButton.teamInfo,
                ),
                PopupMenuItem(
                  child: Text(
                    'Log out',
                  ),
                  onTap: () {
                    print('hi');
                  },
                  value: PopUpMenuButton.logOut,
                ),
              ];
            },
          )
        ],
      ),
      backgroundColor: backgroudColor,
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddScreen(),
                ));
          },
          backgroundColor: custom_green,
          label: Text('Add'),
          icon: Icon(Icons.add),
        ),
      ),
      body: SafeArea(
          child: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.forward) {
            show = true;
            setState(() {});
          }
          if (notification.direction == ScrollDirection.reverse) {
            show = false;
            setState(() {});
          }
          return true;
        },
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return TaskWidget();
          },
        ),
      )),
    );
  }
}
