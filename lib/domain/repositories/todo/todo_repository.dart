import 'package:fpdart/fpdart.dart';
import 'package:task_manager_app/core/exceptions/database/database_exception.dart';
import 'package:task_manager_app/core/exceptions/network/network_exception.dart';
import 'package:task_manager_app/domain/entities/export_entities.dart';

import '../../entities/todo/todo_entity.dart';

abstract class TodoRepository {
  //* REMOTE
  /// Returns all the todos
  Future<Either<NetworkException, TodoEntity>> getTodos();

  /// Returns Random Todos
  Future<Either<NetworkException, TodoEntity>> getRandomTodos();

  /// Returns todos by pagination
  Future<Either<NetworkException, TodoEntity>> getTodosByPagination({
    //? The limit is the number of todos to return
    required int limit,
    //? The skip is the number of todos to skip
    required int skip,
  });

  /// Returns todos of a specific user
  Future<Either<NetworkException, TodoEntity>> getUserTodos({
    required String userId,
  });

  /// Returns the data of the current todo
  Future<Either<NetworkException, TodoEntity>> getTodoDetail({
    required int todoId,
  });

  /// Create a new todo
  Future<Either<NetworkException, TodoDetailEntity>> createTodo({
    required TodoDetailEntity todo,
  });

  /// Update a todo
  Future<Either<NetworkException, TodoDetailEntity>> updateTodo({
    //? The id of the todo to update
    required int todoId,
    required TodoDetailEntity todo,
  });

  /// Delete a todo
  Future<Either<NetworkException, TodoDetailEntity>> deleteTodo({
    //? The id of the todo to delete
    required int todoId,
  });

  //*Local
  /// Returns all saved todos
  Future<Either<DatabaseException, TodoEntity>> getSavedTodos();

  /// Returns details of a saved todo
  Future<Either<DatabaseException, TodoEntity>> getSavedTodoDetail({
    required int todoId,
  });

  /// Save todos
  Future<Either<DatabaseException, void>> saveTodos({
    required TodoEntity todos,
  });

  /// Delete all saved todos
  Future<Either<DatabaseException, void>> deleteSavedTodos();

  /// Returns a boolean indicating if the todos are saved or not
  Future<Either<DatabaseException, bool>> areTodosSaved();
}
