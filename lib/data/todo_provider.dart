import 'package:flutter/material.dart';

import '../entities/todo.dart';


class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(Todo todo) {
    _todos=[..._todos,todo];
    notifyListeners(); // Notify listeners about the state change
  }
  void removeTodo(Todo todo) {
    _todos=_todos.where((todoValue){return todoValue!=todo;}).toList();
    notifyListeners(); // Notify listeners about the state change
  }
}
