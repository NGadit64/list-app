import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/list_controller.dart';

class ListPage extends StatelessWidget {
  ListPage({super.key});

  final ListController controller = Get.find<ListController>();

  @override
  Widget build(BuildContext context) {
    // Ambil data dari argument GetX jika dipanggil dari Get.to()
    final args = Get.arguments as Map<String, String>?;

    if (args != null) {
      controller.setData(
        judul: args['judul'] ?? '',
        kategori: args['kategori'] ?? '',
        deskripsi: args['deskripsi'] ?? '',
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text("Detail ${controller.judul.value}")),
        backgroundColor: controller.getNoteColor(), // warna ikut kategori
      ),
      body: Obx(
        () => Container(
          color: controller.getNoteColor().withOpacity(0.2),
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView( // ⬅️ biar bisa scroll
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.judul.value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Kategori: ${controller.kategori.value}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  controller.deskripsi.value,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.5, // biar lebih enak dibaca
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
