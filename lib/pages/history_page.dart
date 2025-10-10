import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/history_controller.dart';
import '../models/todo.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "History Todo",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 108, 108, 108), // warna gelap suram
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep, color: Colors.white),
            onPressed: controller.clearHistory,
          ),
        ],
      ),

      // 🪶 Background seperti kertas kusam
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFBDBDBD), // abu muda
              const Color(0xFFE0E0E0), // abu keputihan
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          image: const DecorationImage(
            image: AssetImage("assets/paper.jpeg"),
            fit: BoxFit.cover,
            opacity: 0.3, // biar agak suram
          ),
        ),
        child: Obx(() {
          if (controller.history.isEmpty) {
            return const Center(
              child: Text(
                "Belum ada riwayat.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontStyle: FontStyle.italic,
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: controller.history.length,
            itemBuilder: (context, index) {
              final Todo todo = controller.history[index];
              final bool done = todo.isDone;

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: done
                    ? Colors.grey.shade400.withOpacity(0.7)
                    : Colors.grey.shade200.withOpacity(0.6),
                child: ListTile(
                  leading: Icon(
                    done ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: done ? Colors.green.shade700 : Colors.grey.shade600,
                    size: 28,
                  ),
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w600,
                      decoration:
                          done ? TextDecoration.lineThrough : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text(
                    todo.category,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_forever, color: Colors.redAccent),
                    onPressed: () async {
                      await controller.todoC.deleteFromHistory(todo.id);
                      Get.snackbar(
                        "Dihapus",
                        "Todo dihapus permanen",
                        backgroundColor: Colors.black.withOpacity(0.8),
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                        margin: const EdgeInsets.all(10),
                      );
                    },
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
