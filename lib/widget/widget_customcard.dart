import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_app/models/todo.dart';

import 'package:list_app/routes/routes.dart';
import '../pages/list_page.dart';

class CustomCard extends StatelessWidget {
  final Todo todo;
  final VoidCallback onToggleDone;
  final VoidCallback onDelete;

  const CustomCard({
    super.key,
    required this.todo,
    required this.onToggleDone,
    required this.onDelete,
  });

  // pilih warna sesuai kategori
  Color _getNoteColor(String category) {
    switch (category.toLowerCase()) {
      case "pekerjaan":
        return const Color.fromARGB(255, 255, 235, 157); 
      case "sekolah":
        return const Color.fromARGB(255, 255, 251, 182); 
      case "pribadi":
        return const Color.fromARGB(255, 253, 255, 202); //=====
      default:
        return const Color.fromARGB(255, 255, 255, 255); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: _getNoteColor(todo.category), // warna note
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
        title: Text(
          todo.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text("Kategori: ${todo.category}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () {
                Get.toNamed(AppRoutes.editTodo, arguments: todo);
              },
            ),
IconButton(
  icon: const Icon(Icons.delete, color: Colors.red),
onPressed: () {
  Get.defaultDialog(
    title: "Konfirmasi",
    middleText: "Are you sure want to delete this todo?",
    textCancel: "No",
    textConfirm: "Yes",
    confirmTextColor: Colors.white,
    onConfirm: () {
      onDelete();   // hapus
      Get.back();   // tutup dialog
    },
  );
},

),
          ],
        ),
        onTap: () {
          Get.toNamed(AppRoutes.listPage, arguments: {
            'judul': todo.title,
            'kategori': todo.category,
            'deskripsi': todo.description,
          });
        },
        leading: Checkbox(
          value: todo.isDone,
          onChanged: (_) => onToggleDone(),
        ),
      ),
    );
  }
}
