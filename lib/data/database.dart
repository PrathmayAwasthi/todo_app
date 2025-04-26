import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];
  final _myBox = Hive.box('todos');

  void createInitialData() {
    toDoList = [
      ["Make your Bed", false],
      ["Take a Shower", false],
    ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDatabase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
