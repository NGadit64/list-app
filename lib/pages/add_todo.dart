import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_app/controllers/add_todo_controller.dart';
import 'package:list_app/controllers/todo_controller.dart';
import 'package:list_app/models/todo.dart';
import 'package:list_app/widget/widget_button.dart';
import 'package:list_app/widget/widget_textfield.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});

  final addTodoC = Get.put(AddTodoController());
  final todoC = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Todo")),
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
              MyTextField(
                textEditingController: addTodoC.descC,
                labelText: "Deskripsi",
                labelColor: Colors.black,
                pass: false,
                isNumber: false,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: addTodoC.selectedCategory,
                decoration: const InputDecoration(
                  labelText: "Kategori",
                  border: OutlineInputBorder(),
                ),
                items: addTodoC.categories
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
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
