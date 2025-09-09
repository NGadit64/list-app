import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading: Checkbox(
                  value: todo.isDone,
                  onChanged: (_) => todoC.toggleDone(todo.id),
                ),
                title: Text(
                  todo.title,
                  style: TextStyle(
                    decoration:
                        todo.isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
                subtitle: Text("${todo.description}\nKategori: ${todo.category}"),
                isThreeLine: true,
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => todoC.deleteTodo(todo.id),
                ),
              ),
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
