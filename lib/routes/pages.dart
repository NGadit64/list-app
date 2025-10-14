import 'package:list_app/bindings/add_todo_binding.dart';
import 'package:list_app/bindings/dashboard_binding.dart';
import 'package:list_app/bindings/edit_todo_binding.dart';
import 'package:list_app/bindings/history_binding.dart';
import 'package:list_app/bindings/list_binding.dart';
import 'package:list_app/bindings/login_binding.dart';
import 'package:list_app/bindings/respob_binding.dart';
import 'package:list_app/bindings/splashscreen_binding.dart';
import 'package:list_app/bindings/todo_binding.dart';
import 'package:list_app/pages/add_todo.dart';
import 'package:get/get.dart';
import 'package:list_app/pages/edit_todo_page.dart';
import 'package:list_app/pages/history_page.dart';
import 'package:list_app/pages/list_page.dart';
import 'package:list_app/pages/login_page.dart';
import 'package:list_app/pages/profile_page.dart';
import 'package:list_app/pages/dashboard_page.dart';
import 'package:list_app/pages/responsive/login_responsive.dart';
import 'package:list_app/pages/splashscreen_page.dart';
import 'package:list_app/pages/todo_page.dart';
import 'package:list_app/pages/responsive_page.dart';
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.loginPage, page: () => LoginResponsive(), binding: LoginBinding(),),
    GetPage(name: AppRoutes.dashboardPage, page: () => const DashboardPage(), binding: DashboardBinding(),),
    GetPage(name: AppRoutes.addTodo, page: () => AddTodoPage(), binding: AddTodoBinding(),),
    GetPage(name: AppRoutes.profilePage, page: () => const ProfilePage()),
    GetPage(name: AppRoutes.editTodo,page: () => EditTodoPage(todo: Get.arguments),binding: EditTodoBinding(),),
    GetPage(name: AppRoutes.historyPage, page: () => HistoryPage(), binding: HistoryBinding(),),
    GetPage(name: AppRoutes.listPage, page: () => ListPage(), binding: ListBinding(),),
    GetPage(name: AppRoutes.todoPage, page: () => TodoPage(), binding: TodoBinding(), ),
    GetPage(name: AppRoutes.splashScreen, page: () => SplashscreenPage(), binding: SplashscreenBinding(), ),
    GetPage(name: AppRoutes.responsivePage, page: () => ExamplePage(), binding: ResponsiveBinding(), ),
  ];
}
