import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/entities/todo.dart';

import '../../data/todo_provider.dart';

class AddNewTodoScreen extends StatefulWidget {
  const AddNewTodoScreen({super.key});

  @override
  State<AddNewTodoScreen> createState() => _AddNewTodoScreenState();
}

class _AddNewTodoScreenState extends State<AddNewTodoScreen> {
  final titleTEController = TextEditingController();
  final descriptionTEController = TextEditingController();
  final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<TodoProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Todo'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value){
                  if(value?.trim().isEmpty ??true){
                    return 'Enter Your Title';
                  }
                  return null;
                },
                controller: titleTEController,
                decoration:
                    const InputDecoration(labelText: 'Title', hintText: 'Title'),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value){
                  if(value?.trim().isEmpty ??true){
                    return 'Enter Your Title';
                  }
                  return null;
                },
                controller: descriptionTEController,
                maxLength: 200,
                decoration: const InputDecoration(
                    labelText: 'Description', hintText: 'description'),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    state.addTodo(Todo(name: titleTEController.text, description: descriptionTEController.text, time: DateTime.now()));
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromWidth(double.maxFinite),
                    padding: const EdgeInsets.symmetric(vertical: 12)),
                child: const Text('Add'),
              )
            ],
          ),
        ),
      ),
    );

  }
@override
  void dispose() {
    titleTEController.dispose();
    descriptionTEController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}

