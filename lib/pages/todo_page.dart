import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_app/routes/routes.dart';
import 'package:list_app/widget/widget_customcard.dart';
import '../controllers/todo_controller.dart';

class TodoPage extends StatelessWidget {
  final todoC = Get.put(TodoController());

  TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Todo"),
        backgroundColor: const Color(0xFF81C784), // hijau pastel
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient( //gradient
            colors: [
              const Color(0xFFF1F8E9), // putih agak hijau 
              const Color(0xFFFFFDE7), // putih agak kuning
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          image: const DecorationImage(
            image: AssetImage("assets/paper.jpeg"),
            fit: BoxFit.cover,
            opacity: 0.4,
          ),
        ),
        child: Obx(() {
          if (todoC.todos.isEmpty) {
            return const Center(
              child: Text(
                "Belum ada todo",
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: todoC.todos.length,
            itemBuilder: (context, index) {
              final todo = todoC.todos[index];
              return CustomCard(
                todo: todo,
                onToggleDone: () => todoC.toggleDone(todo.id),
                onDelete: () => todoC.deleteTodo(todo.id),
              );
            },
          );
        }),
      ),
        floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFFF176), // kuning
        onPressed: () => Get.toNamed(AppRoutes.addTodo),
        child: const Icon(Icons.add, color: Colors.black87),
      ),
    );
  }
}
