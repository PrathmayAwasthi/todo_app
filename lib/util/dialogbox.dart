import 'package:flutter/material.dart';
import 'package:todo_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController taskNameController;

    return AlertDialog(
        backgroundColor: Color(0xFF222222),
        content: Container(
          height: 120,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Task Name",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(text: "Save", onPressed: () {}),
                  MyButton(text: "Cancel", onPressed: () {})
                ],
              )
            ],
          ),
        ));
  }
}
