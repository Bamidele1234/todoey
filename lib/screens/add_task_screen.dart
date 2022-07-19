import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    required this.addTask,
    required this.addText,
    Key? key,
  }) : super(key: key);

  final Function()? addTask;
  final Function(String)? addText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Column(
            children: [
              const Text(
                'Add Task',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.lightBlueAccent,
                ),
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: addText,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Type Here',
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Material(
                elevation: 5,
                color: Colors.lightBlueAccent,
                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: addTask,
                  height: 55,
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
