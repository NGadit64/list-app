import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_app/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final loginC = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4),
      appBar: AppBar(
        title: const Text("Login Page"),
        backgroundColor: const Color.fromARGB(255, 255, 255, 142),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "To Do Note",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),

            //gambar
            Center(
              child: SizedBox(
                width: 200,
                child: Image.asset('assets/nott.webp'),
              ),
            ),
            const SizedBox(height: 10),
            const Text("Fill Username and password :"),

            // Username
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: loginC.txtUsername,
                decoration: const InputDecoration(
                  hintText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Password
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: loginC.txtPassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Button login
            Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: loginC.login,
                child: const Text("Login"),
              ),
            ),

            Obx(() => Text(loginC.statusLogin.value)),
          ],
        ),
      ),
    );
  }
}
