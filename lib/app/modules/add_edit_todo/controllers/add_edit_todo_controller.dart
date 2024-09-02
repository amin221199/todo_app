import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/app/data/todo_status_enum.dart';

import '../../../data/db_services.dart';
import '../../../models/todo_model.dart';
import '../../todo_list/controllers/todo_list_controller.dart';

class AddEditTodoController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TodoListController todoController = Get.find();
  Todo? todo = Get.arguments?["todo"];

  @override
  void onInit() {
    super.onInit();
    if (todo != null) {
      titleController.text = todo?.title ?? "";
    }
  }

  void addTodo() async {
    try {
      final todo = Todo(
        title: titleController.text.trim(),
      );
      await DatabaseService().insertTodo(todo);
      await todoController.loadTodos();
      Get.back();
    } catch (e) {
      Get.snackbar("Add Error", e.toString());
    }
  }

  void updateTodoTitle() async {
    try {
      final updatedTodo = Todo(
          title: titleController.text.trim(),
          id: todo?.id,
          status: todo?.status ?? TodoStatus.todo);
      await DatabaseService().updateTodo(updatedTodo);
      await todoController.loadTodos();
      Get.back();
    } catch (e) {
      Get.snackbar("Edit Error", e.toString());
    }
  }
}
