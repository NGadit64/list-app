import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.person, size: 100, color: Colors.teal), // ganti gambar pakai icon dulu
            SizedBox(height: 20),
            Text(
              "Username: FAD",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("Email: franruqya@gemali.com"),//per controller = 1 binding
          ],
        ),
      ),
    );
  }
}
