import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:list_app/pages/history_page.dart';
import 'package:list_app/pages/profile_page.dart';
import 'package:list_app/pages/todo_page.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
      TodoPage(),
      HistoryPage(),        
      const ProfilePage(),
    ];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
