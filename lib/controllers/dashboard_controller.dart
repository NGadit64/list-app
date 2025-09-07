import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:list_app/pages/profile_page.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [ProfilePage(), ProfilePage(), ProfilePage()];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
