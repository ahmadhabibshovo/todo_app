import 'package:flutter/material.dart';
import 'package:todo_app/ui/screens/add_new_todo.dart';
import 'package:todo_app/ui/screens/todo_list/all_todo_list_tab.dart';
import 'package:todo_app/ui/screens/todo_list/undone_todo_list_tab.dart';


import '../../../entities/todo.dart';
import 'done_todo_list_tab.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> todos = [
    Todo(name: "Flutter Job", description: "Create Cv ", time: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Todo List'),
            bottom: _buildTabBar(),
          ),
          body:const TabBarView(children: [
            AllTodoListTab(),
            UndoneTodoListTab(),
            DoneTodoListTab(),
          ],),
          floatingActionButton: buildAddTodoFloatingActionButton(),),
    );
  }

  TabBar _buildTabBar() {
    return const TabBar(tabs: [
            Tab(
              text: 'All',
            ),Tab(
              text: 'Undone',
            ),Tab(
              text: 'Done',
            ),

          ],);
  }

  FloatingActionButton buildAddTodoFloatingActionButton() {
    return FloatingActionButton.extended(
      tooltip: 'Add Todo', onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const AddNewTodoScreen()));
    }, label: const Text('Add'), icon: const Icon(Icons.add),);
  }
}


