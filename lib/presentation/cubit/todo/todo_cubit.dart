import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:task_manager_app/domain/entities/export_entities.dart';

import '../../../domain/usecases/todo/todo_usecases.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit(this._todoUsecases) : super(const TodoInitial());

  final TodoUsecases _todoUsecases;

  //* REMOTE
  Future<void> getTodos() async {
    try {
      // Check internet connectivity
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        // No internet: Load saved todos
        final localResult = await _todoUsecases.getSavedTodos();
        localResult.fold(
          (failure) => emit(TodoFailure(failure.message)),
          (todoList) => emit(TodoSuccess(todoList)),
        );
        return;
      }

      // Internet available: Fetch from backend
      emit(const TodoLoading());
      final result = await _todoUsecases.getTodos();

      result.fold(
        (failure) => emit(TodoFailure(failure.message)),
        (todoList) async {
          emit(TodoSuccess(todoList));
          // Save todos locally
          await _saveTodosLocally(todoList);
        },
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> getRandomTodos() async {
    try {
      emit(const TodoLoading());

      final result = await _todoUsecases.getRandomTodos();

      result.fold(
        (failure) => emit(TodoFailure(failure.message)),
        (todoList) => emit(TodoSuccess(todoList)),
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> getTodosByPagination(int page) async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        // No internet: Show error or handle offline state
        emit(
            const TodoFailure('No internet connection. Unable to load todos.'));
        return;
      }

      // Internet available: Fetch paginated data
      emit(const TodoLoading());
      final skip = (page - 1) * 10;
      final result =
          await _todoUsecases.getTodosByPagination(limit: 10, skip: skip);

      result.fold(
        (failure) => emit(TodoFailure(failure.message)),
        (todoList) => emit(TodoSuccess(todoList)),
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> getUserTodos({
    required String userId,
  }) async {
    try {
      emit(const TodoLoading());

      final result = await _todoUsecases.getUserTodos(userId: userId);

      result.fold(
        (failure) => emit(TodoFailure(failure.message)),
        (todoList) => emit(TodoSuccess(todoList)),
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> getTodoDetail({
    required int todoId,
  }) async {
    try {
      emit(const TodoLoading());

      final result = await _todoUsecases.getTodoDetail(todoId: todoId);

      result.fold((failure) => emit(TodoFailure(failure.message)),
          (todo) => emit(TodoSuccess(todo)));
    } catch (_) {
      rethrow;
    }
  }

  Future<void> createTodo({
    required TodoDetailEntity todo,
  }) async {
    try {
      emit(const TodoLoading());

      final result = await _todoUsecases.createTodo(todo: todo);
      debugPrint('createTodo: $result');
      result.fold(
        (failure) => emit(TodoCreatedFailure(failure.message)),
        (todo) => emit(TodoCreatedSuccess(todo)),
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> updateTodo({
    required int todoId,
    required TodoDetailEntity todo,
  }) async {
    try {
      emit(const TodoLoading());

      final result = await _todoUsecases.updateTodo(
        todoId: todoId,
        todo: todo,
      );
      result.fold(
        (failure) => emit(TodoUpdatedFailure(failure.message)),
        (todo) => emit(TodoUpdatedSuccess(todo)),
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> deleteTodo({
    required int todoId,
  }) async {
    try {
      emit(const TodoLoading());

      final result = await _todoUsecases.deleteTodo(
        todoId: todoId,
      );
      debugPrint('deleteTodo: $result');
      result.fold(
        (failure) => emit(TodoDeletedFailure(failure.message)),
        (todo) => emit(TodoDeleted(todo)),
      );
    } catch (_) {
      rethrow;
    }
  }

  //* LOCAL
  Future<void> _saveTodosLocally(TodoEntity todos) async {
    try {
      final result = await _todoUsecases.saveTodos(todos: todos);
      result.fold(
        (failure) => debugPrint('Failed to save todos: ${failure.message}'),
        (_) => debugPrint('Todos saved locally.'),
      );
    } catch (e) {
      debugPrint('Error saving todos locally: $e');
    }
  }

  Future<void> getSavedTodos() async {
    try {
      emit(const TodoLoading());

      final result = await _todoUsecases.getSavedTodos();

      result.fold(
        (failure) => emit(TodoFailure(failure.message)),
        (todoList) => emit(TodoSuccess(todoList)),
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> saveTodos({
    required TodoEntity todos,
  }) async {
    try {
      emit(const TodoLoading());

      final result = await _todoUsecases.saveTodos(todos: todos);

      result.fold(
        (failure) => emit(TodoSavedFailure(failure.message)),
        (todos) => emit(const TodoSavedSuccess()),
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> areTodosSaved() async {
    try {
      emit(const TodoLoading());

      final result = await _todoUsecases.areTodosSaved();

      result.fold(
        (failure) => emit(TodoFailure(failure.message)),
        (todos) => emit(const TodoSavedSuccess()),
      );
    } catch (_) {
      rethrow;
    }
  }
}
