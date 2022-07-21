import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todoey/widgets/task_list.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/data.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  final ksnackBar = const SnackBar(
    content: Text('You have already added this task',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
        )),
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (BuildContext context, data, Widget? child) {
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
                        data.changeString(value);
                      },
                      addTask: () {
                        if (data.myTask != null) {
                          // Ensure that a task has been entered into the field
                          for (var element in data.publicTasks) {
                            if (data.myTask == element.name) {
                              data.copy = true;
                            }
                          }
                          if (!data.copy) {
                            data.addTask();
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(ksnackBar);
                          }
                          data.myTask = null;
                          data.copy = false;
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 80, horizontal: 50),
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
                        data.publicTasks.isNotEmpty
                            ? '${data.taskCount} Tasks'
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
                    child: const TasksList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
