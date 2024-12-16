import 'package:flutter/material.dart';
import 'package:todolist/screens/todo.dart';

class UpdateNewTodoScreen extends StatefulWidget {
  const UpdateNewTodoScreen({
    super.key,
    required this.todo,
    required this.onUpdateTodo
  });


  final Todo todo;
  final Function(Todo) onUpdateTodo;

  @override
  State<UpdateNewTodoScreen> createState() => _UpdateNewTodoScreenState();
}



class _UpdateNewTodoScreenState extends State<UpdateNewTodoScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  void initState() {

    super.initState();
    _titleTEController.text= widget.todo.title;
    _descriptionTEController.text=widget.todo.description;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Update todo"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _fromKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleTEController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Title", hintText: 'Write Your Todo Title'),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Enter Your Title";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _descriptionTEController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    maxLines: 3,
                    decoration: const InputDecoration(
                        labelText: "Description",
                        hintText: 'Write Your Description here'),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Enter Your Description";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if(_fromKey.currentState!.validate()){
                        Todo todo = Todo(
                          title: _titleTEController.text.trim(),
                          description: _descriptionTEController.text.trim(),
                          status: widget.todo.status
                        );
                        widget.onUpdateTodo(todo);
                        Navigator.pop(context);

                      }
                    },
                    child: const Text("Update"),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
