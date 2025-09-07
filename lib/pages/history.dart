import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/pohon.png"), // contoh
            ),
            SizedBox(height: 20),
            Text("Username: FAD",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Email: franruqya@gemali.com"),
          ],
        ),
      ),
    );
  }
}