import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/list_page.dart';

class CustomCard extends StatelessWidget {
  final String judul;
  final String deskripsi;
  final String kategori;
  final bool isDone;
  final VoidCallback onToggleDone;
  final VoidCallback onDelete;

  const CustomCard({
    super.key,
    required this.judul,
    required this.deskripsi,
    required this.kategori,
    required this.isDone,
    required this.onToggleDone,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Checkbox(
          value: isDone,
          onChanged: (_) => onToggleDone(),
        ),
        title: Text(
          judul,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            decoration: isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text("Kategori: $kategori"),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
        onTap: () {
          Get.to(() => ListPage(
                judul: judul,
                kategori: kategori,
                deskripsi: deskripsi,
              ));
        },
      ),
    );
  }
}
