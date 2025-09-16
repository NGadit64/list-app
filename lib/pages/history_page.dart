import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_app/controllers/history_controller.dart';

class HistoryPage extends StatelessWidget {
  final historyC = Get.put(HistoryController());

  HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Todo"),
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever, color: Colors.white),
            onPressed: () => historyC.clearHistory(),
          ),
        ],
      ),
      body: Obx(() {
        if (historyC.history.isEmpty) {
          return const Center(
            child: Text(
              "Belum ada todo yang dihapus",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          );
        }
        return ListView.builder(
          itemCount: historyC.history.length,
          itemBuilder: (context, index) {
            final todo = historyC.history[index];
            return ListTile(
              leading: Icon(
                todo.isDone ? Icons.check_circle : Icons.radio_button_unchecked,
                color: todo.isDone ? Colors.green : Colors.grey,
              ),
              title: Text(
                todo.title,
                style: TextStyle(
                  decoration: todo.isDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              subtitle: Text("Kategori: ${todo.category}"),
            );
          },
        );
      }),
    );
  }
}