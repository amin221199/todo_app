import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_list_app/app/routes/app_pages.dart';

import '../../../widgets/todo_item.dart';
import '../controllers/todo_list_controller.dart';

class TodoListView extends GetView<TodoListController> {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.todos.length,
          itemBuilder: (context, index) {
            return TodoItem(
              title: controller.todos[index].title,
              statusValue: controller.todos[index].status,
              onChanged: (status) {
                controller.updateTodoStatus(index, status!);
              },
              onPressedEdit: () {
                Get.toNamed(Routes.ADD_EDIT_TODO,
                    arguments: {"todo": controller.todos[index]});
              },
              onPressedDelete: () {
                controller.deleteTodoById(controller.todos[index].id!);
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_EDIT_TODO),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
