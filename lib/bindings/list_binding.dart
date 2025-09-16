import 'package:get/get.dart';
import 'package:list_app/controllers/list_controller.dart';

class ListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListController>(() => ListController());
  }
}
