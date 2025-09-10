import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/list_controller.dart';

class ListPage extends StatelessWidget {
  ListPage({super.key});

  final ListController controller = Get.put(ListController());

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
      appBar: AppBar(title: Obx(() => Text("Detail ${controller.judul}"))),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.judul,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "Kategori: ${controller.kategori}",
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                Text(controller.deskripsi, style: const TextStyle(fontSize: 18)),
              ],
            )),
      ),
    );
  }
}
