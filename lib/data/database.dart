import 'package:hive/hive.dart';

class ToDoDatabase {
  final _myBox = Hive.openBox('todos');
}
