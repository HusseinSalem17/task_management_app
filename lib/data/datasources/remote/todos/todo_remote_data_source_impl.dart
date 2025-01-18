import 'package:task_manager_app/core/network/dio_client.dart';
import 'package:task_manager_app/data/datasources/remote/todos/todo_remote_data_source.dart';
import 'package:task_manager_app/data/models/export_models.dart';

import '../../../../core/constants/url_constants.dart';

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final DioClient _dioClient;

  const TodoRemoteDataSourceImpl(this._dioClient);

  @override
  Future<TodoDetailModel> createTodo({required TodoDetailModel todo}) async {
    try {
      final response = await _dioClient.post(
        '${UrlConstants.todos}/add',
        data: todo.toJson(),
      );
      final model = TodoDetailModel.fromJson(response.data);
      return model;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TodoDetailModel> deleteTodo({required int todoId}) async {
    try {
      final result = await _dioClient.delete('${UrlConstants.todos}/$todoId');
      return TodoDetailModel.fromJson(result.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TodoModel> getRandomTodos() async {
    try {
      final response = await _dioClient.get(UrlConstants.randomTodos);
      final TodoModel models = TodoModel.fromJson(response.data);
      return models;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TodoModel> getTodoDetail({required int todoId}) async {
    try {
      final response = await _dioClient.get('${UrlConstants.todos}/$todoId');
      final model = TodoModel.fromJson(response.data);
      return model;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TodoModel> getTodos() async {
    try {
      final response = await _dioClient.get(UrlConstants.todos);
      final TodoModel models = TodoModel.fromJson(response.data);
      return models;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TodoModel> getTodosByPagination(
      {required int limit, required int skip}) async {
    try {
      final response = await _dioClient.get(
        '${UrlConstants.todos}?limit=$limit&skip=$skip',
      );
      final TodoModel models = TodoModel.fromJson(response.data);
      return models;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TodoModel> getUserTodos({required String userId}) async {
    try {
      final response =
          await _dioClient.get('${UrlConstants.todos}/user/$userId');
      final TodoModel models = TodoModel.fromJson(response.data);
      return models;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TodoDetailModel> updateTodo(
      {required int todoId, required TodoDetailModel todo}) async {
    try {
      final todoData = todo.toJson()..remove('id');
      final response = await _dioClient.put(
        '${UrlConstants.todos}/$todoId',
        data: todoData,
      );
      final model = TodoDetailModel.fromJson(response.data);
      return model;
    } catch (e) {
      rethrow;
    }
  }
}
