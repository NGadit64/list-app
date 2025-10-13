import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_app/controllers/responsive_controller.dart';
import 'package:list_app/pages/dashboard_page.dart';
import 'package:list_app/pages/dashboard_wide_page.dart';

class ExamplePage extends StatelessWidget {
  ExamplePage({super.key});

  final controller = Get.find<ResponsiveController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints){
          controller.updateLayout(constraints);
          return Obx(()=> controller.isMobile.value ? DashboardPage() : DashboardWidescreen());
        }
        ),
    );
  }
}