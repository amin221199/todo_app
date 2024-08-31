import 'package:flutter/material.dart';

import '../data/todo_status_enum.dart';

class TodoItem extends StatelessWidget {
  final void Function(TodoStatus?)? onChanged;
  final void Function()? onPressedDelete;
  final void Function()? onPressedEdit;
  final TodoStatus statusValue;
  final String title;

  const TodoItem(
      {required this.title,
      required this.statusValue,
      required this.onChanged,
      required this.onPressedDelete,
      required this.onPressedEdit,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: ListTile(
          title: Text(
            title,
          ),
          leading: DropdownButton<TodoStatus>(
            value: statusValue,
            onChanged: onChanged,
            padding: EdgeInsets.zero,
            items: TodoStatus.values
                .map<DropdownMenuItem<TodoStatus>>((TodoStatus value) {
              return DropdownMenuItem<TodoStatus>(
                value: value,
                child: Text(value.toString().split('.').last),
              );
            }).toList(),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(icon: const Icon(Icons.edit), onPressed: onPressedEdit),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: onPressedDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
