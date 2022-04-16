import 'package:flutter/material.dart';

class TodoDeleteDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("削除します"),
      content: const Text("よろしいですか?"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("キャンセル")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text("削除"))
      ],
    );
  }
}
