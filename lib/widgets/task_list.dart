import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/data.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (BuildContext context, data, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = data.publicTasks[index];
            return TaskTile(
              isChecked: task.isDone,
              item: task.name,
              checkboxCallback: (bool? newValue) {
                data.updateTask(task);
              },
              longPress: () {
                data.removeTask(task);
              },
            );
          },
          itemCount: data.taskCount,
          padding: const EdgeInsets.all(34),
        );
      },
    );
  }
}
