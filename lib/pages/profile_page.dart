import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final creators = [
      {"name": "Adit",  "image": "assets/adit.jpeg"},
      {"name": "Faruq",  "image": "assets/dafi.jpeg"},
      {"name": "Francis",  "image": "assets/francis.jpeg"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Profile Page")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: creators
              .map((creator) => Column(
                    children: [
                      CircleAvatar(
                        radius: 81.079365,
                        backgroundImage: AssetImage(creator["image"]!),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Name: ${creator['name']}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
