import 'package:flutter/material.dart';
import '../util/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow[600],
        title: const Text(
          "TO-DO LIST",
        ),
      ),
      body: ListView(
        children: [
          Todo(
            taskName: "Make Your Bed",
            taskCompleted: true,
          ),
        ],
      ),
    );
  }
}
