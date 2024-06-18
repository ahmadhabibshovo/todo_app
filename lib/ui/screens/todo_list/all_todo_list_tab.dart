import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/data/todo_provider.dart';
import 'package:todo_app/ui/screens/todo_list/todo_list_screen.dart';
import 'package:todo_app/ui/widgets/empty.dart';
import 'package:todo_app/ui/widgets/todo_item.dart';


class AllTodoListTab extends StatefulWidget {
  const AllTodoListTab({
    super.key,

  });

  @override
  State<AllTodoListTab> createState() => _AllTodoListTabState();
}

class _AllTodoListTabState extends State<AllTodoListTab> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<TodoProvider>(context, listen: true);

    return state.todos.length==0?Empty():ListView.builder(
      itemCount: state.todos.length,
      itemBuilder: (context, index) {
        return TodoItem(
          todo: state.todos[index],
          onIconButtonPressed: () {
            state.todos[index].isDone=!state.todos[index].isDone;
            setState(() {

            });
          },
        );
      },
    );
  }
}
