import 'package:flutter/material.dart';
import 'package:todo_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController taskNameController;
  VoidCallback onSave;
  DialogBox({
    super.key,
    required this.taskNameController,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: const Color(0xFF222222),
        content: SizedBox(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Task Name",
                ),
                controller: taskNameController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(text: "Save", onPressed: onSave),
                  MyButton(
                      text: "Cancel", onPressed: () => Navigator.pop(context))
                ],
              )
            ],
          ),
        ));
  }
}
