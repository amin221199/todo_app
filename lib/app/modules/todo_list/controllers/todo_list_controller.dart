import 'package:get/get.dart';
import 'package:todo_list_app/app/data/todo_status_enum.dart';
import '../../../models/todo_model.dart';
import '../../../data/db_services.dart';

class TodoListController extends GetxController {
  var todos = <Todo>[].obs;

  @override
  void onInit() async {
    await loadTodos();
    super.onInit();
  }

  Future<void> loadTodos() async {
    try {
      final data = await DatabaseService().getTodos();
      todos.assignAll(data);
    } catch (e) {
      Get.snackbar("Fetch Error", e.toString());
    }
  }

  void updateTodoStatus(int index, TodoStatus status) async {
    try {
      todos[index].status = status;
      await DatabaseService().updateTodo(todos[index]);
      await loadTodos();
    } catch (e) {
      Get.snackbar("Status Error", e.toString());
    }
  }

  void deleteTodoById(int id) async {
    try {
      await DatabaseService().deleteTodo(id);
      await loadTodos();
    } catch (e) {
      Get.snackbar("Delete Error", e.toString());
    }
  }
}
