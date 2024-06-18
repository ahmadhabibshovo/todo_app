import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/ui/widgets/empty.dart';
import 'package:todo_app/ui/widgets/todo_item.dart';

import '../../../data/todo_provider.dart';

class UndoneTodoListTab extends StatefulWidget {
  const UndoneTodoListTab({
    super.key,
  });

  @override
  State<UndoneTodoListTab> createState() => _UndoneTodoListTabState();
}

class _UndoneTodoListTabState extends State<UndoneTodoListTab> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<TodoProvider>(context, listen: true);
    final undoneTodo =  state.todos.where((todoValue) {
      return todoValue.isDone == false;
    }).toList();
    return undoneTodo.length==0?Empty():ListView.builder(
        itemCount: undoneTodo.length,
        itemBuilder: (context, index) {
          return TodoItem(
            todo: undoneTodo[index],
            onIconButtonPressed: () {
              state.todos[index].isDone=!state.todos[index].isDone;
              setState(() {

              });
            },
          );
        });
  }
}
