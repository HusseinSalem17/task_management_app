import 'package:fpdart/fpdart.dart';
import 'package:task_manager_app/domain/entities/export_entities.dart';
import 'package:task_manager_app/domain/repositories/todo/todo_repository.dart';

import '../../../core/exceptions/database/database_exception.dart';
import '../../../core/exceptions/network/network_exception.dart';

class TodoUsecases {
  final TodoRepository _homeRepository;

  const TodoUsecases(this._homeRepository);
  //* REMOTE
  /// Returns all the todos
  Future<Either<NetworkException, TodoEntity>> getTodos() async {
    return _homeRepository.getTodos();
  }

  /// Returns Random Todos
  Future<Either<NetworkException, TodoEntity>> getRandomTodos() async {
    return _homeRepository.getRandomTodos();
  }

  /// Returns todos by pagination
  Future<Either<NetworkException, TodoEntity>> getTodosByPagination({
    //? The limit is the number of todos to return
    required int limit,
    //? The skip is the number of todos to skip
    required int skip,
  }) async {
    return _homeRepository.getTodosByPagination(limit: limit, skip: skip);
  }

  /// Returns todos of a specific user
  Future<Either<NetworkException, TodoEntity>> getUserTodos({
    required String userId,
  }) async {
    return _homeRepository.getUserTodos(userId: userId);
  }

  /// Returns the data of the current todo
  Future<Either<NetworkException, TodoEntity>> getTodoDetail({
    required int todoId,
  }) async {
    return _homeRepository.getTodoDetail(todoId: todoId);
  }

  /// Create a new todo
  Future<Either<NetworkException, TodoDetailEntity>> createTodo({
    required TodoDetailEntity todo,
  }) async {
    return _homeRepository.createTodo(todo: todo);
  }

  /// Update a todo
  Future<Either<NetworkException, TodoDetailEntity>> updateTodo({
    //? The id of the todo to update
    required int todoId,
    required TodoDetailEntity todo,
  }) async {
    return _homeRepository.updateTodo(todoId: todoId, todo: todo);
  }

  /// Delete a todo
  Future<Either<NetworkException, TodoDetailEntity>> deleteTodo({
    //? The id of the todo to delete
    required int todoId,
  }) async {
    return _homeRepository.deleteTodo(todoId: todoId);
  }

  //*Local
  /// Returns all saved todos
  Future<Either<DatabaseException, TodoEntity>> getSavedTodos() async {
    return _homeRepository.getSavedTodos();
  }

  /// Returns details of a saved todo
  Future<Either<DatabaseException, TodoEntity>> getSavedTodoDetail({
    required int todoId,
  }) async {
    return _homeRepository.getSavedTodoDetail(todoId: todoId);
  }

  /// Save todos
  Future<Either<DatabaseException, void>> saveTodos({
    required TodoEntity todos,
  }) async {
    return _homeRepository.saveTodos(todos: todos);
  }

  /// Delete all saved todos
  Future<Either<DatabaseException, void>> deleteSavedTodos() async {
    return _homeRepository.deleteSavedTodos();
  }

  /// Returns a boolean indicating if the todos are saved or not
  Future<Either<DatabaseException, bool>> areTodosSaved() async {
    return _homeRepository.areTodosSaved();
  }
}
