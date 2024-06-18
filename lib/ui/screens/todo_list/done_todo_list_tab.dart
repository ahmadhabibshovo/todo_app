
import 'package:provider/provider.dart';
import 'package:todo_app/ui/widgets/empty.dart';
import 'package:todo_app/ui/widgets/todo_item.dart';
import 'package:flutter/material.dart';
import '../../../data/todo_provider.dart';
class DoneTodoListTab extends StatefulWidget {
  const DoneTodoListTab({
    super.key,

  });

  @override
  State<DoneTodoListTab> createState() => _DoneTodoListTabState();
}

class _DoneTodoListTabState extends State<DoneTodoListTab> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<TodoProvider>(context, listen: true);
    final doneTodo =  state.todos.where((todoValue) {
      return todoValue.isDone == true;
    }).toList();
    return doneTodo.length==0?Empty():ListView.builder(
        itemCount: doneTodo.length,
        itemBuilder: (context, index) {
          return TodoItem(todo: doneTodo[index], onIconButtonPressed: () {
            state.todos[index].isDone=!state.todos[index].isDone;
            setState(() {

            });
          },);
        });
  }
}
