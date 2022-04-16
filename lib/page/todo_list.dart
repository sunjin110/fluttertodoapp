import 'package:flutter/material.dart';
import 'package:todoapp/dialog/todo_delete_dialog.dart';
import 'package:todoapp/page/todo_add.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  _TodoListPage createState() => _TodoListPage();
}

class _TodoListPage extends State<TodoListPage> {
  List<String> todoList = [];

  Widget body(bool isEmpty) {
    if (isEmpty) {
      return const Center(
        child: Text("TODOを追加してください"),
      );
    }
    return ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (ctx, index) {
          return Card(
            child: ListTile(
              title: Text(todoList[index]),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () async {
                  final isDeleteConfirmed = await showDialog(
                      context: ctx,
                      builder: (_) {
                        return TodoDeleteDialog();
                      });

                  if (isDeleteConfirmed) {
                    setState(() {
                      todoList.removeAt(index);
                    });
                  }
                },
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("リスト一覧"),
      ),
      body: body(todoList.isEmpty),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final todoStr =
              await Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) {
            return const TodoAddPage();
          }));

          if (todoStr == null || todoStr == "") {
            return;
          }
          setState(() {
            todoList.add(todoStr);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
