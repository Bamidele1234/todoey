import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/models/task.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(
      name: 'Wash Bathroom',
    ),
    Task(
      name: 'Make School List',
    ),
    Task(
      name: 'Clean car boot',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(34),
      children: const [
        TaskTile(),
      ],
    );
  }
}
