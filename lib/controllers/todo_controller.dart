import 'package:get/get.dart';
import 'package:list_app/pages/todo_page.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  void addTodo(Todo todo) {
    todos.add(todo);
  }

  void toggleDone(String id) {
    int index = todos.indexWhere((t) => t.id == id);
    if (index != -1) {
      todos[index] = todos[index].copyWith(isDone: !todos[index].isDone);
    }
  }

  void deleteTodo(String id) {
    todos.removeWhere((t) => t.id == id);
  }

  List<Todo> get activeTodos => todos.where((t) => !t.isDone).toList();
  List<Todo> get doneTodos => todos.where((t) => t.isDone).toList();
}
