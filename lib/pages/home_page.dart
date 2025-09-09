import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final todoC = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo List")),
      body: Obx(() {
        if (todoC.todos.isEmpty) {
          return const Center(child: Text("Belum ada todo"));
        }
        return ListView.builder(
          itemCount: todoC.todos.length,
          itemBuilder: (_, i) {
            final todo = todoC.todos[i];
            return ListTile(
              title: Text(todo.title),
              subtitle: Text(todo.category),
              leading: Checkbox(
                value: todo.isDone,
                onChanged: (_) => todoC.toggleDone(todo.id),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => todoC.deleteTodo(todo.id),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed("/addTodo"),
        child: const Icon(Icons.add),
      ),
    );
  }
}
