import 'package:list_app/pages/add_todo.dart';
import 'package:get/get.dart';
import 'package:list_app/pages/login_page.dart';
import 'package:list_app/pages/profile_page.dart';
import 'package:list_app/pages/dashboard_page.dart'; // ✅ tambahin
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.loginPage, page: () => const LoginPage()),
    GetPage(name: AppRoutes.dashboardPage, page: () => const DashboardPage()),
    GetPage(name: AppRoutes.addTodo, page: () => AddTodoPage()),
    GetPage(name: AppRoutes.profilePage, page: () => const ProfilePage()),
  ];
}
