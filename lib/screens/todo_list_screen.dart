import 'package:flutter/material.dart';
import 'package:todolist/screens/add_new_todo_screen.dart';
import 'package:todolist/screens/update_new_todo_screen.dart';
import 'package:todolist/screens/todo.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<Todo> listofTodo = [];

  void _addTodo(Todo todo) {
    listofTodo.add(todo);
    setState(() {});
  }

  void _deleteTodo(int index) {
    listofTodo.removeAt(index);
    setState(() {});
  }

  void _updateTodo(int index, Todo todo) {
    listofTodo[index] = todo;
    setState(() {});
  }

  void _updateTodoStatus(int index, TodoStatus status) {
    listofTodo[index].status = status;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo List"),
      ),
      body: Visibility(
        visible: listofTodo.isNotEmpty,
        replacement: Center(
          child: Text('Empty list'),
        ),
        child: ListView.builder(
            itemCount: listofTodo.length,
            itemBuilder: (context, index) {
              Todo todo = listofTodo[index];
              return ListTile(
                  title: Text(todo.title),
                  subtitle: Text(todo.description),
                  leading: Text(todo.status.name),
                  trailing: Wrap(
                    children: [
                      IconButton(
                          onPressed: () {
                            _deleteTodo(index);
                          },
                          icon: const Icon(Icons.delete)),
                      IconButton(onPressed: () => _showChangeStatusDilog(index),
                          icon: const Icon(Icons.edit))
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UpdateNewTodoScreen()));
                  });
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Todo? todo = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddNewTodoScreen(),
              ));
          if (todo != null) {
            _addTodo(todo);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showChangeStatusDilog(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Change Status'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Idel'),
                  onTap: () {
                    _ontapupdateStatusButton(index, TodoStatus.idle);
                  },
                ),
                Divider(),
                ListTile(
                  title: const Text('In progress'),
                  onTap: () {
                    _ontapupdateStatusButton(index, TodoStatus.inProcess);
                  },
                ),
                Divider(),
                ListTile(
                  title: const Text('Done'),
                  onTap: () {
                    _ontapupdateStatusButton(index, TodoStatus.done);
                  },
                ),
              ],
            ),
          );
        });
  }

  void _ontapupdateStatusButton(int index, TodoStatus status){
    _updateTodoStatus(index, status);
    Navigator.pop(context);
  }
}
