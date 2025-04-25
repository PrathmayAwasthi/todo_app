import 'package:flutter/material.dart';
import 'package:todo_app/util/dialogbox.dart';
import 'package:todo_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List toDoList = [
    ["make your bed", false],
    ["make your bed", false],
  ];

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      Navigator.pop(context);
      _controller.text = ""; // or _controller.clear()
    });
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            taskNameController: _controller,
            onSave: saveNewTask,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222222),
      appBar: AppBar(
        title: const Text("To-Do"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: const Color(0xFF111111),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
              onChanged: (value) => checkBoxChanged(value, index),
              taskCompleted: toDoList[index][1],
              taskName: toDoList[index][0]);
        },
      ),
    );
  }
}
