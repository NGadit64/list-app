import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_app/controllers/dashboard_controller.dart';

class MainmenuPage extends StatelessWidget {
  MainmenuPage({super.key});

  DashboardController dashboardController = Get.put(DashboardController());
  //final dashboardController = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: Text("My Menu Example")),
        body:
            dashboardController.pages[dashboardController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          onTap: dashboardController.changePage,
          currentIndex: dashboardController.selectedIndex.value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
