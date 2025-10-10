import 'package:get/get.dart';
import 'package:list_app/controllers/login_controller.dart';
import 'package:list_app/controllers/splashscreen_controller.dart';
import 'package:list_app/pages/splashscreen_page.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());
  }
}
