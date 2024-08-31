import 'package:get/get.dart';

import '../modules/add_edit_todo/bindings/add_edit_todo_binding.dart';
import '../modules/add_edit_todo/views/add_edit_todo_view.dart';
import '../modules/todo_list/bindings/todo_list_binding.dart';
import '../modules/todo_list/views/todo_list_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TODO_LIST;

  static final routes = [
    GetPage(
      name: _Paths.TODO_LIST,
      page: () => const TodoListView(),
      binding: TodoListBinding(),
    ),
    GetPage(
      name: _Paths.ADD_EDIT_TODO,
      page: () => const AddEditTodoView(),
      binding: AddEditTodoBinding(),
    ),
  ];
}
