import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_app/controllers/splashscreen_controller.dart';

class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});

  final controller = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // abu terang, biar lembut
      body: Center(
        child: Image.asset(
          "assets/nott.webp",
          width: 220,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
