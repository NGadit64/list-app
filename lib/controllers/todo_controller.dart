import 'package:get/get.dart';
import '../models/todo.dart';
import '../dbHelper.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  var history = <Todo>[].obs;

  final _dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    loadTodos();
    loadHistory();
  }

  Future<void> loadTodos() async {
    final data = await _dbHelper.getTodos();
    todos.assignAll(data);
  }

  Future<void> loadHistory() async {
    final data = await _dbHelper.getHistory();
    history.assignAll(data);
  }

  Future<void> addTodo(Todo todo) async {
    await _dbHelper.insertTodo(todo);
    await loadTodos();
  }

  Future<void> toggleDone(String id) async {
    int index = todos.indexWhere((t) => t.id == id);
    if (index != -1) {
      final updated = todos[index].copyWith(isDone: !todos[index].isDone);
      await _dbHelper.updateTodo(updated);
      await loadTodos();
    }
  }

  Future<void> updateTodo(String id, Todo updatedTodo) async {
    await _dbHelper.updateTodo(updatedTodo);
    await loadTodos();
  }

  Future<void> deleteTodo(String id) async {
    // pindahkan ke history dulu
    final todo = todos.firstWhere((t) => t.id == id);
    await _dbHelper.insertHistory(todo);
    // hapus dari todos
    await _dbHelper.deleteTodo(id);
    await loadTodos();
    await loadHistory();
  }

  Future<void> deleteFromHistory(String id) async {
    await _dbHelper.deleteHistory(id);
    await loadHistory();
  }


}
