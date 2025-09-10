import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTodoController extends GetxController {
  final titleC = TextEditingController();
  final descC = TextEditingController();
  final categories = ['Sekolah', 'Pekerjaan', 'Pribadi'];
  String? selectedCategory;

  @override
  void onClose() {
    titleC.dispose();
    descC.dispose();
    super.onClose();
  }

  void setCategory(String? value) {
    selectedCategory = value;
    update(); // biar bisa di-refresh kalau pakai GetBuilder
  }
}
