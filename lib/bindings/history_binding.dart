import 'package:get/get.dart';
import 'package:list_app/controllers/history_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    //bidning
    Get.lazyPut<HistoryController>(() => HistoryController());
  }
}
