import 'package:get/get.dart';

class ListController extends GetxController {
  // Data yang diterima
  late String judul;
  late String kategori;
  late String deskripsi;

  void setData({required String judul, required String kategori, required String deskripsi}) {
    this.judul = judul;
    this.kategori = kategori;
    this.deskripsi = deskripsi;
    update(); // memberi tahu UI ada update
  }
}
