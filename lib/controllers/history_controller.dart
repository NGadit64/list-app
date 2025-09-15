import 'package:get/get.dart';
import 'package:list_app/controllers/todo_controller.dart';
import 'package:list_app/models/todo.dart';

class HistoryController extends GetxController {
  final todoC = Get.find<TodoController>();

  RxList<Todo> history = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    history.assignAll(todoC.history); // ambil dari todoController
  }

  void clearHistory() {
    history.clear();
  }
}
