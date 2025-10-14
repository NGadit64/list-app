import 'package:get/get.dart';
import 'package:list_app/controllers/login_controller.dart';
import 'package:list_app/controllers/responsive_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<ResponsiveController>(() => ResponsiveController());
  }
}
