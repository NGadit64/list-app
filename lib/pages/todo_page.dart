import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_app/widget/widget_customcard.dart';
import '../controllers/todo_controller.dart';
import '../models/todo.dart';
import 'add_todo.dart';

class TodoPage extends StatelessWidget {
  final todoC = Get.put(TodoController());

  TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Todo")),
      body: Obx(() {
        if (todoC.todos.isEmpty) {
          return const Center(child: Text("Belum ada todo"));
        }
        return ListView.builder(
          itemCount: todoC.todos.length,
          itemBuilder: (context, index) {
            final todo = todoC.todos[index];
            return CustomCard(
              judul: todo.title,
              deskripsi: todo.description,
              kategori: todo.category,
              isDone: todo.isDone,
              onToggleDone: () => todoC.toggleDone(todo.id),
              onDelete: () => todoC.deleteTodo(todo.id),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddTodo()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
