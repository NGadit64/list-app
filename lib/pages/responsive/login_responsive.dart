import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_app/controllers/responsive_controller.dart';
import 'package:list_app/pages/login_page.dart';
import 'package:list_app/pages/widescreen/login_widescreen.dart';

class LoginResponsive extends StatelessWidget {
  LoginResponsive({super.key});

  final controller = Get.find<ResponsiveController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(() => controller.isMobile.value
              ? LoginPage()
              : LoginPageWidescreen());
        },
      ),
    );
  }
}
