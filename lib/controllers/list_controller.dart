import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListController extends GetxController {
  var judul = ''.obs;
  var kategori = ''.obs;
  var deskripsi = ''.obs;

  void setData({
    required String judul,
    required String kategori,
    required String deskripsi,
  }) {
    this.judul.value = judul;
    this.kategori.value = kategori;
    this.deskripsi.value = deskripsi;
  }

  /// Fungsi menentukan warna berdasarkan kategori
  Color getNoteColor() {
    switch (kategori.value.toLowerCase()) {
      case "pekerjaan":
        return const Color.fromARGB(255, 255, 235, 157); 
      case "sekolah":
        return const Color.fromARGB(255, 255, 251, 182); 
      case "pribadi":
        return const Color.fromARGB(255, 253, 255, 202); //=====
      default:
        return const Color.fromARGB(255, 255, 255, 255); 
    }
  }
}
