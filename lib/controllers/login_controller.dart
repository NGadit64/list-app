import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_app/routes/routes.dart';

class LoginController extends GetxController {
  final txtUsername = TextEditingController();
  final txtPassword = TextEditingController();

  var statusLogin = "Login status".obs;

  void login() {
    if (txtUsername.text == "admin" && txtPassword.text == "admin123") {
      statusLogin.value = "Sukses login";
      Get.offNamed(AppRoutes.dashboardPage);
    } else {
      statusLogin.value = "Gagal login";
      Get.snackbar(
        "Login Error",
        "Username/Password salah",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[200],
      );
    }
  }

  @override
  void onClose() {
    txtUsername.dispose();
    txtPassword.dispose();
    super.onClose();
  }
}
