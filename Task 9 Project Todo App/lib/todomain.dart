

import 'package:bytewise_project/database.dart';
import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final _taskNameController = TextEditingController();
  final _taskDescriptionController = TextEditingController();
  final _taskNameControllerupdate = TextEditingController();
  final _taskDescriptionControllerupdate = TextEditingController();
  TaskManager taskManager = TaskManager();
  late Future<List<Task>> tasks;

  @override
  void initState() {
    super.initState();
    tasks = TaskManager().getTasks();
    setState(() {});
  }

  @override
  void dispose() {
    _taskNameController.dispose();
    _taskDescriptionController.dispose();
    _taskNameControllerupdate.dispose();
    _taskDescriptionControllerupdate.dispose();
    super.dispose();
  }
  Future<void> _editTaskDialog(Task task) async {
    _taskNameControllerupdate.text = task.name;
    _taskDescriptionControllerupdate.text = task.description;
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _taskNameControllerupdate,
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'Task Name',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _taskDescriptionControllerupdate,
                  decoration: const InputDecoration(
                    labelText: 'Task Description',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Task newTask = Task(
                  name: _taskNameControllerupdate.text,
                  description: _taskDescriptionControllerupdate.text,
                );
                var pass = task.name;

                await taskManager.updateTask(newTask,pass);
                setState(() {
                  tasks = taskManager.getTasks();
                });
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Add Your Todo's Now",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder<List<Task>>(
          future: tasks,
          builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  Task task = snapshot.data![index];
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.task, size: 35),
                      title: Text(task.name),
                      subtitle: Text(task.description),
                      trailing: Wrap(
                        spacing: 12, // space between two icons
                        children: <Widget>[
                          GestureDetector(
                            onTap: ()  {_editTaskDialog(task);},
                            child: const Icon(Icons.edit), // icon-1
                          ),
                          GestureDetector(
                            onTap: () async{
                              await taskManager.deleteTask(task);
                              setState(() {
                                tasks = taskManager.getTasks();
                              });
                            },
                            child: const Icon(Icons.delete), // icon-2
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Add New Task'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _taskNameController,
                      autofocus: true,
                      decoration: const InputDecoration(
                        labelText: 'Task Name',
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _taskDescriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Task Description',
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () async {
                      String taskName = _taskNameController.text;
                      String taskDescription = _taskDescriptionController.text;
                      Task newTask = Task(name: taskName, description: taskDescription);
                      await taskManager.addTask(newTask);
                      Navigator.pop(context, 'OK');
                      setState(() {
                        tasks = taskManager.getTasks();
                      });
                      _taskNameController.clear();
                      _taskDescriptionController.clear();
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
          label: const Text('Add'),
          icon: const Icon(Icons.add),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
