import 'package:get/get.dart';
import '../models/todo.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  var history = <Todo>[].obs; // <- daftar todo yang sudah dihapus

  void addTodo(Todo todo) {
    todos.add(todo);
  }

  void toggleDone(String id) {
    int index = todos.indexWhere((t) => t.id == id);
    if (index != -1) {
      todos[index] = todos[index].copyWith(isDone: !todos[index].isDone);
    }
  }

  void updateTodo(String id, Todo updatedTodo) {
    final index = todos.indexWhere((t) => t.id == id);
    if (index != -1) {
      todos[index] = updatedTodo;
      todos.refresh();
    }
  }

  void deleteTodo(String id) {
    final index = todos.indexWhere((t) => t.id == id);
    if (index != -1) {
      // pindahkan ke history
      history.add(todos[index]);
      // hapus dari list utama
      todos.removeAt(index);
    }
  }

  List<Todo> get activeTodos => todos.where((t) => !t.isDone).toList();
  List<Todo> get doneTodos => todos.where((t) => t.isDone).toList();
}
