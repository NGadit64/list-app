import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/todo.dart';
import 'todo_controller.dart';

class EditTodoController extends GetxController {
  final todoC = Get.find<TodoController>();

  late TextEditingController titleC;
  late TextEditingController descC;
  String? selectedCategory;

  final List<String> categories = ["Sekolah", "Pekerjaan", "Pribadi"];
  late Todo todo;

  void setTodo(Todo t) {
    todo = t;
    titleC = TextEditingController(text: t.title);
    descC = TextEditingController(text: t.description);
    selectedCategory = t.category;
  }

  void saveChanges() {
    todoC.updateTodo(
      todo.id,
      todo.copyWith(
        title: titleC.text,
        description: descC.text,
        category: selectedCategory ?? todo.category,
      ),
    );
    Get.back(); // balik ke halaman sebelumnya
  }

  @override
  void onClose() {
    titleC.dispose();
    descC.dispose();
    super.onClose();
  }
}
