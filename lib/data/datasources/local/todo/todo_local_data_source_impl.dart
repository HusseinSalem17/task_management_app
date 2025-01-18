import 'package:isar/isar.dart';
import 'package:task_manager_app/data/datasources/local/_collections/export_collections.dart';

import '../../../../core/database/local_database.dart';
import 'todo_local_data_source.dart';

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final LocalDatabase localDatabase;

  TodoLocalDataSourceImpl(this.localDatabase);

  @override
  Future<bool> areTodosSaved() async {
    try {
      final db = localDatabase.db;
      final todos = await db.todoCollections.where().findAll();
      return todos.isNotEmpty;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteSavedTodos() async {
    try {
      final db = localDatabase.db;
      return db.writeTxn(() async {
        await db.todoCollections.where().deleteAll();
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TodoCollection> getSavedTodoDetail({required int todoId}) async {
    try {
      final db = localDatabase.db;
      final todo =
          await db.todoCollections.where().idEqualTo(todoId).findFirst();
      if (todo == null) {
        throw Exception('Todo not found');
      }
      return todo;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TodoCollection> getSavedTodos() async {
    try {
      final db = localDatabase.db;
      final todos = await db.todoCollections.where().findFirst();
      return todos!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> saveTodos({required TodoCollection todos}) async {
    try {
      final db = localDatabase.db;
      return db.writeTxn(() async {
        await db.todoCollections.put(todos);
      });
    } catch (e) {
      rethrow;
    }
  }
}
