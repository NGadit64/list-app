import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:list_app/pages/dashboard_page.dart';
import 'package:list_app/routes/routes.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checklogin();
  }

  checklogin() async {
    await Future.delayed(Duration(seconds: 3));
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("username") != null) {
      Get.offAllNamed(AppRoutes.dashboardPage);
    } else {
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }
}
//flutter pub add shared_preferences