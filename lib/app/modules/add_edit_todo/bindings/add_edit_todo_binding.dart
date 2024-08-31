import 'package:get/get.dart';

import '../controllers/add_edit_todo_controller.dart';

class AddEditTodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditTodoController>(
      () => AddEditTodoController(),
    );
  }
}
