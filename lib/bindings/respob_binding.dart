import 'package:get/get.dart';
import 'package:list_app/controllers/responsive_controller.dart';
import 'package:list_app/controllers/dashboard_controller.dart';

class ResponsiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResponsiveController>(() => ResponsiveController());
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}