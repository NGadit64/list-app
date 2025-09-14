import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edit_todo_controller.dart';
import '../models/todo.dart';
import '../widget/widget_textfield.dart';
import '../widget/widget_multiline_textfield.dart';
import '../widget/widget_dropdown.dart';
import '../widget/widget_button.dart';

class EditTodoPage extends StatelessWidget {
  final Todo todo;

  const EditTodoPage({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EditTodoController>();
    controller.setTodo(todo);

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Todo")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<EditTodoController>(
          builder: (_) => Column(
            children: [
              MyTextField(
                textEditingController: controller.titleC,
                labelText: "Judul",
                labelColor: Colors.black,
                pass: false,
                isNumber: false,
              ),
              const SizedBox(height: 16),
              MyMultilineTextField(
                textEditingController: controller.descC,
                labelText: "Deskripsi",
              ),
              const SizedBox(height: 16),
              MyDropdown(
                value: controller.selectedCategory,
                items: controller.categories,
                labelText: "Kategori",
                onChanged: (val) {
                  controller.selectedCategory = val;
                  controller.update();
                },
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: "Simpan Perubahan",
                textColor: const Color.fromARGB(255, 93, 92, 92),
                backgroundColor: const Color.fromARGB(255, 255, 191, 0),
                onPressed: controller.saveChanges,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
