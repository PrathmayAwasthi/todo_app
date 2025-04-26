import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/dialogbox.dart';
import 'package:todo_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('todos');
  final _controller = TextEditingController();
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      Navigator.pop(context);
      _controller.text = ""; // or _controller.clear()
    });
    db.updateDatabase();
  }

  void deleteTask(int ind) {
    setState(() {
      db.toDoList.removeAt(ind);
    });
    db.updateDatabase();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
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
      body: db.toDoList.isNotEmpty
          ? ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  onChanged: (value) => checkBoxChanged(value, index),
                  taskCompleted: db.toDoList[index][1],
                  taskName: db.toDoList[index][0],
                  deleteTask: (context) => deleteTask(index),
                );
              },
            )
          : const Center(child: Text("You Currently have no To-Dos")),
    );
  }
}
