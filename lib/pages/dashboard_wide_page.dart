import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_app/controllers/dashboard_controller.dart';

class DashboardWidescreen extends StatelessWidget {
  const DashboardWidescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Obx(() {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: controller.changePage,
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.list),
                  label: Text("Todos"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.history),
                  label: Text("History"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person),
                  label: Text("Profile"),
                ),
              ],
            ),
            Expanded(
              child: controller.pages[controller.selectedIndex.value],
            ),
          ],
        ),
      );
    });
  }
}
