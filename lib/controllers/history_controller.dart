import 'package:get/get.dart';
import 'package:list_app/controllers/todo_controller.dart';
import 'package:list_app/models/todo.dart';

class HistoryController extends GetxController {
  final todoC = Get.find<TodoController>();

  // langsung reference ke todoC.history biar reactive
  RxList<Todo> get history => todoC.history;

  void clearHistory() {
    todoC.history.clear();
  }
}