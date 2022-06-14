import 'package:mobil/models/todo.dart';
import 'package:sqflite/sqflite.dart';
import '../models/todo.dart';

class TodoService {
  static TodoService instance = TodoService._internal();

  TodoService._internal();

  factory TodoService() {
    return instance;
  }

  Future<List<Todo>> getTodos(bool isDone) async {
    final mapList = await getTodoMaps();
    List<Todo> todoList = [];

    for (var element in mapList) {
      todoList.add(Todo.fromMap(element));
    }

    if (isDone) {
      return todoList.where((element) => element.isDone!).toList();
    }
    return todoList.where((element) => element.isDone!).toList();
  }

  Future<List<Map<String, dynamic>>> getTodoMaps() async {
    Database db = await this.db;
    return await db.query('todos');
  }

  static Database? _db;

  Future<Database> get db async {
    _db ??= await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final todoDb = await openDatabase("todo.db", version: 1, onCreate: _createDb);
    return todoDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT,' 'title TEXT,description TEXT,isDone INT)');
  }

  Future<int> addTodo(Todo todo) async {
    Database db = await this.db;
    int res = await db.insert('todos', todo.toMap());
    print(res.toString());
    return res;
  }

  Future<int> updateIsDone(Todo todo) async {
    Database db = await this.db;
    return await db
        .update('todos', todo.toMap(), where: 'id=?', whereArgs: [todo.id]);
  }
}
