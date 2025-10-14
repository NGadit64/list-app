import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/todo.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todo_app.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE todos(
            id TEXT PRIMARY KEY,
            title TEXT,
            description TEXT,
            category TEXT,
            isDone INTEGER
          )
        ''');
        await db.execute('''
          CREATE TABLE history(
            id TEXT PRIMARY KEY,
            title TEXT,
            description TEXT,
            category TEXT,
            isDone INTEGER
          )
        ''');
      },
    );
  }

  // ─────── CRUD TODO ────────────── //

  Future<int> insertTodo(Todo todo) async {
    final client = await db;
    return await client.insert('todos', todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Todo>> getTodos() async {
    final client = await db;
    final result = await client.query('todos', orderBy: 'title ASC');
    return result.map((e) => Todo.fromMap(e)).toList();
  }

  Future<int> updateTodo(Todo todo) async {
    final client = await db;
    return await client.update('todos', todo.toMap(),
        where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<int> deleteTodo(String id) async {
    final client = await db;
    return await client.delete('todos', where: 'id = ?', whereArgs: [id]);
  }

  // ─────── HISTORY ──────────────

  Future<int> insertHistory(Todo todo) async {
    final client = await db;
    return await client.insert('history', todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Todo>> getHistory() async {
    final client = await db;
    final result = await client.query('history', orderBy: 'title ASC');
    return result.map((e) => Todo.fromMap(e)).toList();
  }

  Future<int> deleteHistory(String id) async {
    final client = await db;
    return await client.delete('history', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> clearHistory() async {
    final client = await db;
    await client.delete('history');
  }

  // ───────────logout───────────── // aestehtic banget dit kayak gini

  Future<void> clearAllData() async {
    final client = await db;
    await client.delete('todos'); 
    await client.delete('history'); 
}
}
