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

  /// Fungsi untuk menentukan warna note berdasarkan kategori
  Color getNoteColor() {
    switch (kategori.value.toLowerCase()) {
      case "pekerjaan":
        return const Color(0xFFC8E6C9); // hijau pastel
      case "sekolah":
        return const Color(0xFFBBDEFB); // biru pastel
      case "pribadi":
        return const Color(0xFFFFF9C4); // kuning pastel
      default:
        return const Color(0xFFE1BEE7); // ungu pastel (default)
    }
  }
}
