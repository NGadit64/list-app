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
      backgroundColor: const Color.fromARGB(255, 246, 227, 163),
      appBar: AppBar(
        title: const Text(
          "Edit Todo",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 188, 94), // coklat lembut seperti kertas
        elevation: 0,
      ),
      body: Container(

        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: GetBuilder<EditTodoController>(
              builder: (_) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  MyTextField(
                    textEditingController: controller.titleC,
                    labelText: "Judul",
                    labelColor: Colors.black87,
                    pass: false,
                    isNumber: false,
                  ),
                  const SizedBox(height: 20),
                  MyMultilineTextField(
                    textEditingController: controller.descC,
                    labelText: "Deskripsi",
                  ),
                  const SizedBox(height: 20),
                  MyDropdown(
                    value: controller.selectedCategory,
                    items: controller.categories,
                    labelText: "Kategori",
                    onChanged: (val) {
                      controller.selectedCategory = val;
                      controller.update();
                    },
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: CustomButton(
                      text: "Simpan Perubahan",
                      textColor: const Color(0xFF333333),
                      backgroundColor:
                          const Color.fromARGB(255, 251, 185, 54), // kuning lembut
                      onPressed: controller.saveChanges,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
