import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'dart:collection';

class Data extends ChangeNotifier {
  final List<Task> _myTasks = [];
  String? myTask;
  bool copy = false;

  addTask() {
    _myTasks.add(Task(name: myTask.toString()));
    notifyListeners();
  }

  changeString(String newString) {
    myTask = newString;
    notifyListeners();
  }

  get taskCount => _myTasks.length;
  UnmodifiableListView<Task> get publicTasks => UnmodifiableListView(_myTasks);
}
