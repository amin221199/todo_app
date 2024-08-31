import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_list_app/app/data/color_const.dart';

import '../controllers/add_edit_todo_controller.dart';

class AddEditTodoView extends GetView<AddEditTodoController> {
  const AddEditTodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.todo != null ? "Edit Todo" : 'Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColor)),
              ),
              cursorColor: AppColors.primaryColor,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (controller.todo != null) {
                  controller.updateTodoTitle();
                } else {
                  controller.addTodo();
                }
              },
              child: Text(
                controller.todo != null ? 'Edit Todo' : 'Add Todo',
                style: const TextStyle(color: AppColors.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
