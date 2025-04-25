import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/util/dialogbox.dart';
import 'package:todo_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.openBox('todos');
  final _controller = TextEditingController();
  List toDoList = [];

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      Navigator.pop(context);
      _controller.text = ""; // or _controller.clear()
    });
  }

  void deleteTask(int ind) {
    setState(() {
      toDoList.removeAt(ind);
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
      backgroundColor: const Color(0xFF222222),
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
      body: toDoList.isNotEmpty
          ? ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  onChanged: (value) => checkBoxChanged(value, index),
                  taskCompleted: toDoList[index][1],
                  taskName: toDoList[index][0],
                  deleteTask: (context) => deleteTask(index),
                );
              },
            )
          : const Center(child: Text("You Currently have no To-Dos")),
    );
  }
}
