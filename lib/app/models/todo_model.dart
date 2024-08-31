import 'package:todo_list_app/app/data/todo_status_enum.dart';

class Todo {
  int? id;
  String title;
  TodoStatus status;

  Todo({
    this.id,
    required this.title,
    this.status = TodoStatus.todo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'status': status.index,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      status: TodoStatus.values[map['status']],
    );
  }
}
