
import 'package:list_app/pages/add_todo.dart';
import 'package:get/get.dart';
import 'package:list_app/pages/login_page.dart';
import 'package:list_app/pages/profile_page.dart';
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.addTodo, page: () => AddTodo()),
   //GetPage(name: AppRoutes.dashboardPage, page: () => DashboardPage()),
    GetPage(name: AppRoutes.profilePage, page: () => ProfilePage()),
    GetPage(name: AppRoutes.loginPage, page: () => LoginPage()),
  ];
}
