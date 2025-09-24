import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_app/controllers/dashboard_controller.dart';
import 'package:list_app/pages/profile_page.dart';
import 'package:list_app/pages/todo_page.dart';
import 'package:list_app/pages/history_page.dart'; 

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    

    return Obx(() {
      return Scaffold(
        body: controller.pages[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changePage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Todos",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history), 
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}
