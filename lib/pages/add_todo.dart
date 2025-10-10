import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_app/controllers/add_todo_controller.dart';
import 'package:list_app/controllers/todo_controller.dart';
import 'package:list_app/models/todo.dart';
import 'package:list_app/widget/widget_button.dart';
import 'package:list_app/widget/widget_textfield.dart';
import 'package:list_app/widget/widget_dropdown.dart';
import 'package:list_app/widget/widget_multiline_textfield.dart'; // ⬅️ Tambahkan ini

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});

  final addTodoC = Get.find<AddTodoController>();
  final todoC = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4),
      appBar: AppBar(title: const Text("Tambah Todo"), backgroundColor: const Color.fromARGB(255, 255, 255, 142),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GetBuilder<AddTodoController>(
          builder: (_) => Column(
            children: [
              MyTextField(
                textEditingController: addTodoC.titleC,
                labelText: "Judul",
                labelColor: Colors.black,
                pass: false,
                isNumber: false,
              ),
              const SizedBox(height: 12),

              // 🔽 Multiline TextField untuk Deskripsi
              MyMultilineTextField(
                textEditingController: addTodoC.descC,
                labelText: "Deskripsi",
                labelColor: Colors.black,
              ),

              const SizedBox(height: 12),
              MyDropdown(
                value: addTodoC.selectedCategory,
                items: addTodoC.categories,
                labelText: "Kategori",
                onChanged: addTodoC.setCategory,
              ),
              const SizedBox(height: 20),

              CustomButton(
                text: "Simpan",
                textColor: Colors.black,
                backgroundColor: const Color.fromARGB(255, 247, 225, 143),
                onPressed: () {
                  if (addTodoC.titleC.text.isNotEmpty &&
                      addTodoC.selectedCategory != null) {
                    todoC.addTodo(
                      Todo(
                        id: DateTime.now()
                            .millisecondsSinceEpoch
                            .toString(),
                        title: addTodoC.titleC.text,
                        description: addTodoC.descC.text,
                        category: addTodoC.selectedCategory!,
                      ),
                    );
                    Get.back();
                    Get.snackbar(
                      "Sukses",
                      "Todo berhasil ditambahkan",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green[200],
                    );
                  } else {
                    Get.snackbar(
                      "Error",
                      "Judul & kategori harus diisi",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red[200],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
