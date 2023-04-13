import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Task {
  final String name;
  final String description;

  Task({required this.name, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
    };
  }

  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      name: map['name'],
      description: map['description'],
    );
  }
}

class TaskManager {
  final String taskKey = 'tasks';

  Future<void> addTask(Task task) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> tasks = prefs.getStringList(taskKey) ?? [];

    tasks.add(jsonEncode(task.toMap()));
    await prefs.setStringList(taskKey, tasks);
  }

  Future<List<Task>> getTasks() async {
    final prefs = await SharedPreferences.getInstance();

    List<String> taskStrings = prefs.getStringList(taskKey) ?? [];

    List<Task> tasks = taskStrings.map((taskString) {
      return Task.fromMap(jsonDecode(taskString));
    }).toList();

    return tasks;
  }

  Future<void> updateTask(Task task,String newname) async {
    final prefs = await SharedPreferences.getInstance();
     List<String> taskStrings = prefs.getStringList(taskKey) ?? [];

    List<Task> tasks = taskStrings.map((taskString) {
      return Task.fromMap(jsonDecode(taskString));
    }).toList();


    int index = tasks.indexWhere((element) => element.name == newname );

    if (index != -1) {
      tasks[index] = task;

      List<String> updatedTasks = tasks.map((task) {

        return jsonEncode(task.toMap());
      }).toList();

      await prefs.setStringList(taskKey, updatedTasks);
    }
  }

  Future<void> deleteTask(Task task) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> taskStrings = prefs.getStringList(taskKey) ?? [];

    List<Task> tasks = taskStrings.map((taskString) {
      return Task.fromMap(jsonDecode(taskString));
    }).toList();

    tasks.removeWhere((element) => element.name == task.name);

    List<String> updatedTasks = tasks.map((task) {
      return jsonEncode(task.toMap());
    }).toList();

    await prefs.setStringList(taskKey, updatedTasks);
  }
}
