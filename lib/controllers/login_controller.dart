import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final txtUsername = TextEditingController();
  final txtPassword = TextEditingController();

  var statusLogin = "Login status".obs;

  login() async {
    if (txtUsername.text.toString() == "admin" && txtPassword.text.toString() == "admin123") {
      statusLogin.value = "Sukses login";
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("username", txtUsername.text.toString());
      Get.offAllNamed(AppRoutes.dashboardPage);
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
