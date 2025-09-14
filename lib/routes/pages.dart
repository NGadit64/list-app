import 'package:list_app/bindings/add_todo_binding.dart';
import 'package:list_app/bindings/dashboard_binding.dart';
import 'package:list_app/bindings/edit_todo_binding.dart';
import 'package:list_app/pages/add_todo.dart';
import 'package:get/get.dart';
import 'package:list_app/pages/edit_todo_page.dart';
import 'package:list_app/pages/login_page.dart';
import 'package:list_app/pages/profile_page.dart';
import 'package:list_app/pages/dashboard_page.dart'; // ✅ tambahin
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.loginPage, page: () => LoginPage()),
    GetPage(name: AppRoutes.dashboardPage, page: () => const DashboardPage(), binding: DashboardBinding(),),
    GetPage(name: AppRoutes.addTodo, page: () => AddTodoPage(), binding: AddTodoBinding(),),
    GetPage(name: AppRoutes.profilePage, page: () => const ProfilePage()),
    GetPage(name: AppRoutes.editTodo,page: () => EditTodoPage(todo: Get.arguments),binding: EditTodoBinding(),),
  ];
}
