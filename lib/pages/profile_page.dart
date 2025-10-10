import 'package:flutter/material.dart';
import 'package:list_app/widget/widget_button.dart'; // pastikan sudah buat file ini

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final creators = [
      {"name": "Adit", "image": "assets/adit.jpeg"},
      {"name": "Faruq", "image": "assets/dafi.jpeg"},
      {"name": "Francis", "image": "assets/francis.jpeg"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profil Pembuat",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 244, 220, 65), // coklat lembut
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 224, 120), // abu terang
              Color.fromARGB(255, 255, 242, 184), // krem lembut
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          image: const DecorationImage(
            image: AssetImage("assets/paper.jpeg"),
            fit: BoxFit.cover,
            opacity: 0.3,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: creators.length,
                itemBuilder: (context, index) {
                  final creator = creators[index];
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(creator["image"]!),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        creator['name']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 25),
                    ],
                  );
                },
              ),
            ),
            // Tombol satu di bawah
            CustomButton(
              text: "Batang luar",
              textColor: Colors.black87,
              backgroundColor: const Color.fromARGB(255, 241, 211, 133),
              onPressed: () {
                // buat LOgsout
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
