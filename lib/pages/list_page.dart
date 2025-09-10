import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  final String judul;
  final String kategori;
  final String deskripsi;

  const ListPage({
    super.key,
    required this.judul,
    required this.kategori,
    required this.deskripsi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail $judul")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              judul,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Kategori: $kategori",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(deskripsi, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
