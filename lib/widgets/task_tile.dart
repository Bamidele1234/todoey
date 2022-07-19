import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        'Buy Milk',
        style: TextStyle(
          fontSize: 18,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskCheckBox(
        checkedBoxState: isChecked,
        callBackParam: (bool? newValue) {
          setState(() {
            isChecked = newValue!;
          });
        },
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  const TaskCheckBox({
    Key? key,
    required this.checkedBoxState,
    required this.callBackParam,
  }) : super(key: key);

  final bool checkedBoxState;
  final Function(bool?)? callBackParam;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkedBoxState,
      onChanged: callBackParam,
    );
  }
}
