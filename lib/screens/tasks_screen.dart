import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_list.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/models/task.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> myTasks = [];
  bool copy = false;
  String? myTask;

  displaySb(String message) =>
      ScaffoldMessenger.of(context).showSnackBar(ksnackBar(message));

  ksnackBar(String message) => SnackBar(
        duration: const Duration(milliseconds: 1200),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic),
        ),
      );

  // List<Task> tasks = [
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
          size: 30,
          semanticLabel: 'Create a new task',
        ),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: kRoundedBorder,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddTaskScreen(
                  addText: (String value) {
                    myTask = value;
                  },
                  addTask: () {
                    if (myTask != null) {
                      // Ensure that a task has been entered into the field
                      for (var element in myTasks) {
                        if (myTask == element.name) {
                          copy = true;
                        }
                      }
                      if (!copy) {
                        setState(() {
                          myTasks.add(
                            Task(
                              name: myTask.toString(),
                            ),
                          );
                        });
                      } else {
                        displaySb('You have already added this task');
                      }
                      myTask = null;
                      copy = false;
                    }
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          );
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: Icon(
                      color: Colors.lightBlueAccent,
                      Icons.list,
                      size: 42,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Todoey',
                    style: TextStyle(
                      fontSize: 52,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    myTasks.isNotEmpty
                        ? '${myTasks.length} Tasks'
                        : 'No current tasks',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: TasksList(
                  tasks: myTasks,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
