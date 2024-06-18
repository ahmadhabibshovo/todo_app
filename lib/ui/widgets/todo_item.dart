import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../data/todo_provider.dart';
import '../../entities/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback onIconButtonPressed;
    TodoItem({
    super.key,
    required this.todo, required this.onIconButtonPressed,
  });
  DateFormat formatter = DateFormat.yMMMMd('en_US').add_jm();
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<TodoProvider>(context, listen: true);
    return Card(
      surfaceTintColor: _getTintColor(todo.isDone),
      color: _getBgColor(todo.isDone),
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: (d){
state.removeTodo(todo);
        },
        child: ListTile(
          title: Text(
            todo.name,
            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,decoration: _getTextDecoration(todo.isDone)),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(todo.description),
              Text(formatter.format(todo.time)),
            ],
          ),
          trailing: _buildRoundedIconButton(todo.isDone,onIconButtonPressed),
        ),
      ),
    );
  }
}

Widget _buildRoundedIconButton(bool isDone,VoidCallback onIconButtonPressed) {
  return InkWell(onTap: onIconButtonPressed,child: CircleAvatar(child: Icon(!isDone ? Icons.check : Icons.clear)));
}

TextDecoration? _getTextDecoration(isDone) {
  return isDone ? TextDecoration.lineThrough : null;
}
Color? _getTintColor(isDone) {
  return isDone ? Colors.green : null;
}
Color? _getBgColor(isDone) {
  return isDone ? Colors.green.shade100 : null;
}