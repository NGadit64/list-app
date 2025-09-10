import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_app/models/todo.dart';
import 'package:list_app/pages/todo_page.dart';
import 'package:list_app/widget/widget_button.dart';
import 'package:list_app/widget/widget_textfield.dart';
import '../controllers/todo_controller.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final titleC = TextEditingController();
  final descC = TextEditingController();
  final categories = ['Sekolah', 'Pekerjaan', 'Pribadi'];
  String? selectedCategory;

  final todoC = Get.find<TodoController>();

  @override
  void dispose() {
    titleC.dispose();
    descC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Todo")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            MyTextField(
              textEditingController: titleC,
              labelText: "Judul",
              labelColor: Colors.black,
              pass: false,
              isNumber: false,
            ),
            const SizedBox(height: 12),
            MyTextField(
              textEditingController: descC,
              labelText: "Deskripsi",
              labelColor: Colors.black,
              pass: false,
              isNumber: false,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: const InputDecoration(
                labelText: "Kategori",
                border: OutlineInputBorder(),
              ),
              items: categories
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (val) => setState(() => selectedCategory = val),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Simpan",
              textColor: Colors.black,
              backgroundColor: const Color.fromARGB(255, 247, 225, 143),
              onPressed: () {
                if (titleC.text.isNotEmpty && selectedCategory != null) { //buat ngecek isian todo
                  todoC.addTodo(
                    Todo(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      title: titleC.text,
                      description: descC.text,
                      category: selectedCategory!,
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
    );
  }
}
