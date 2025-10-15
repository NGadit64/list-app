import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_app/controllers/login_controller.dart';

class LoginPageWidescreen extends StatelessWidget {
  LoginPageWidescreen({super.key});

  final loginC = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    const Color darkBrown = Color(0xFF3E2723);
    const Color brown = Color(0xFF795548);
    const Color lightYellow = Color(0xFFFFF9C4);
    const Color lighterYellow = Color(0xFFFFFDE7);

    return Scaffold(
      backgroundColor: lightYellow,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 40),
          child: Container(
            width: 900,
            height: 520,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: Colors.brown.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              children: [
                // 🟤 LEFT: Image + Branding section
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [brown, Color(0xFF5D4037)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(32),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/nott.webp',
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "To-Do Notes",
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.4,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Organize your day beautifully",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // 🟡 RIGHT: Login form section
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        const SizedBox(height: 39),

                        // Username TextField
                        TextField(
                          controller: loginC.txtUsername,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: lighterYellow,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                              const BorderSide(color: brown, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Color(0xFF5D4037), width: 2),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Password TextField
                        TextField(
                          controller: loginC.txtPassword,
                          obscureText: true,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: lighterYellow,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                              const BorderSide(color: brown, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Color(0xFF5D4037), width: 2),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: loginC.login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: brown,
                              foregroundColor: Colors.white,
                              padding:
                              const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 3,
                            ),
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.1,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Status login
                        Obx(
                              () => Text(
                            loginC.statusLogin.value,
                            style: const TextStyle(
                              color: darkBrown,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
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
