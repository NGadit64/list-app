import 'package:flutter/material.dart';
import 'package:list_app/routes/routes.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String statusLogin = "Login status";
  final txtUsername = TextEditingController();
  final txtPassword = TextEditingController();

  @override
  void dispose() {
    txtUsername.dispose();
    txtPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome To Our APPPP",
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
                child: Image.asset('assets/pohon.png'),
              ),
            ),
            const SizedBox(height: 10),
            const Text("Fill Username and password :"),

            // Username
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: txtUsername,
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
                controller: txtPassword,
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
                onPressed: () {
                  if (txtUsername.text == "admin" &&
                      txtPassword.text == "admin123") {
                    setState(() {
                      statusLogin = "Sukses login";
                    });
                    Get.offNamed(AppRoutes.dashboardPage); //page setelah Login
                  } else {
                    setState(() {
                      statusLogin = "Gagal login";
                    });
                    Get.snackbar("Login Error", "Username/Password salah",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red[200]);
                  }
                },
                child: const Text("Login"),
              ),
            ),
            Text(statusLogin),
          ],
        ),
      ),
    );
  }
}
