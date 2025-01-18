import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:fpdart/fpdart.dart';
import 'package:task_manager_app/core/exceptions/database/database_exception.dart';
import 'package:task_manager_app/data/datasources/export_datasources.dart';
import 'package:task_manager_app/data/datasources/local/_collections/todo/todo_collection.dart';
import 'package:task_manager_app/data/models/export_models.dart';
import 'package:task_manager_app/domain/entities/export_entities.dart';
import 'package:task_manager_app/domain/repositories/export_repositories.dart';

import '../../../core/exceptions/network/network_exception.dart';
import '../../../domain/entities/todo/todo_entity.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource _todoRemoteDataSource;
  final TodoLocalDataSource _todoLocalDataSource;

  TodoRepositoryImpl(this._todoRemoteDataSource, this._todoLocalDataSource);

  //* REMOTE
  @override
  Future<Either<NetworkException, TodoEntity>> getTodos() async {
    try {
      final result = await _todoRemoteDataSource.getTodos();
      return Right(result.toEntity());
    } on DioException catch (e) {
      debugPrint('getTodos todo_repository_impl: $e');
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, TodoEntity>> getTodoDetail(
      {required int todoId}) async {
    try {
      final result = await _todoRemoteDataSource.getTodoDetail(todoId: todoId);
      return Right(result.toEntity());
    } on DioException catch (e) {
      debugPrint('getTodoDetail todo_repository_impl: $e');
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, TodoEntity>> getTodosByPagination(
      {required int limit, required int skip}) async {
    try {
      final result = await _todoRemoteDataSource.getTodosByPagination(
        limit: limit,
        skip: skip,
      );
      return Right(result.toEntity());
    } on DioException catch (e) {
      debugPrint('getTodosByPagination todo_repository_impl: $e');
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, TodoEntity>> getUserTodos(
      {required String userId}) async {
    try {
      final result = await _todoRemoteDataSource.getUserTodos(userId: userId);
      return Right(result.toEntity());
    } on DioException catch (e) {
      debugPrint('getUserTodos todo_repository_impl: $e');
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, TodoDetailEntity>> createTodo(
      {required TodoDetailEntity todo}) async {
    try {
      final result = await _todoRemoteDataSource.createTodo(
        todo: const TodoDetailModel().fromEntity(todo),
      );
      return Right(result.toEntity());
    } on DioException catch (e) {
      debugPrint('createTodo todo_repository_impl: $e');
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, TodoDetailEntity>> updateTodo(
      {required int todoId, required TodoDetailEntity todo}) async {
    try {
      final result = await _todoRemoteDataSource.updateTodo(
        todoId: todoId,
        todo: const TodoDetailModel().fromEntity(todo),
      );
      return Right(result.toEntity());
    } on DioException catch (e) {
      debugPrint('updateTodo todo_repository_impl: $e');
      return Left(NetworkException.fromDioError(e));
    }
  }

  //* LOCAL
  @override
  Future<Either<DatabaseException, void>> deleteSavedTodos() async {
    try {
      await _todoLocalDataSource.deleteSavedTodos();
      return const Right(null);
    } on DatabaseException catch (e) {
      debugPrint('deleteSavedTodos todo_repository_impl: $e');
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, TodoDetailEntity>> deleteTodo(
      {required int todoId}) async {
    try {
      final result = await _todoRemoteDataSource.deleteTodo(todoId: todoId);
      return Right(result.toEntity());
    } on DioException catch (e) {
      debugPrint('deleteTodo todo_repository_impl: $e');
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, TodoEntity>> getRandomTodos() async {
    try {
      final result = await _todoRemoteDataSource.getRandomTodos();
      return Right(result.toEntity());
    } on DioException catch (e) {
      debugPrint('getRandomTodos todo_repository_impl: $e');
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<DatabaseException, bool>> areTodosSaved() async {
    try {
      final result = await _todoLocalDataSource.areTodosSaved();
      return Right(result);
    } on DatabaseException catch (e) {
      debugPrint('areTodosSaved todo_repository_impl: $e');
      return Left(e);
    }
  }

  @override
  Future<Either<DatabaseException, TodoEntity>> getSavedTodoDetail(
      {required int todoId}) async {
    try {
      final result =
          await _todoLocalDataSource.getSavedTodoDetail(todoId: todoId);
      return Right(result.toEntity());
    } on DatabaseException catch (e) {
      debugPrint('getSavedTodoDetail todo_repository_impl: $e');
      return Left(e);
    }
  }

  @override
  Future<Either<DatabaseException, TodoEntity>> getSavedTodos() async {
    try {
      final result = await _todoLocalDataSource.getSavedTodos();
      return Right(result.toEntity());
    } on DatabaseException catch (e) {
      debugPrint('getSavedTodos todo_repository_impl: $e');
      return Left(e);
    }
  }

  @override
  Future<Either<DatabaseException, void>> saveTodos(
      {required TodoEntity todos}) async {
    try {
      await _todoLocalDataSource.saveTodos(
        todos: TodoCollection().fromEntity(todos),
      );
      return const Right(null);
    } on DatabaseException catch (e) {
      debugPrint('saveTodos todo_repository_impl: $e');
      return Left(e);
    }
  }
}
