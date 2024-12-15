import 'package:flutter/material.dart';

class UpdateNewTodoScreen extends StatefulWidget {
  const UpdateNewTodoScreen({super.key});



  @override
  State<UpdateNewTodoScreen> createState() => _UpdateNewTodoScreenState();
}

final TextEditingController _titleTEController = TextEditingController();
final TextEditingController _descriptionTEController = TextEditingController();
final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

class _UpdateNewTodoScreenState extends State<UpdateNewTodoScreen> {
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
