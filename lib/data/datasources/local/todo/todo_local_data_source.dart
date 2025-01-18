import '../_collections/export_collections.dart';

abstract class TodoLocalDataSource {
  const TodoLocalDataSource();

  // Returns a list of todos
  Future<TodoCollection> getSavedTodos();

  /// Returns details of a saved todo
  Future<TodoCollection> getSavedTodoDetail({
    required int todoId,
  });

  // Save a list of todos
  Future<void> saveTodos({required TodoCollection todos});

  // Delete all saved todos
  Future<void> deleteSavedTodos();

  // Returns a boolean indicating if there are saved todos
  Future<bool> areTodosSaved();
}
