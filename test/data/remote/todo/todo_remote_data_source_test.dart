import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_manager_app/core/constants/url_constants.dart';
import 'package:task_manager_app/data/datasources/remote/todos/todo_remote_data_source_impl.dart';
import 'package:task_manager_app/data/models/todo/todo_model.dart';
import 'package:task_manager_app/data/models/todo/todo_detail_model.dart';

import '../../../_utils/json_reader.dart';
import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late MockDioClient mockDioClient;
  late TodoRemoteDataSourceImpl todoRemoteDataSource;

  late TodoModel tTodoModel;
  late TodoDetailModel tTodoDetailModel;

  late dynamic todoJson;
  late dynamic todoDetailJson;

  setUpAll(() {
    mockDioClient = MockDioClient();
    todoRemoteDataSource = TodoRemoteDataSourceImpl(mockDioClient);

    todoJson = jsonReader('todo_dummy_data.json');
    todoDetailJson = jsonReader('todo_detail_dummy_data.json');

    tTodoModel = TodoModel.fromJson(todoJson as Map<String, dynamic>);
    tTodoDetailModel =
        TodoDetailModel.fromJson(todoDetailJson as Map<String, dynamic>);
  });

  //* This is the test for the method `getTodos`
  group('getTodos', () {
    late Response<dynamic> response;
    late Exception exception;

    setUpAll(() {
      exception = Exception();

      response = Response<dynamic>(
        data: todoJson,
        requestOptions: RequestOptions(
          path: UrlConstants.todos,
        ),
      );
    });

    test(
      'should return a [TodoModel] when the call to the data source is successful',
      () async {
        //* Arrange
        when(mockDioClient.get(
          UrlConstants.todos,
        )).thenAnswer(
          (_) async => response,
        );

        //* Act
        final result = await todoRemoteDataSource.getTodos();

        //* Assert
        expect(result, isA<TodoModel>());
        expect(result, equals(tTodoModel));
      },
    );

    test(
      'should throw an exception when the response is unsuccessful',
      () async {
        //* Arrange
        when(mockDioClient.get(
          UrlConstants.todos,
        )).thenThrow(exception);

        //* Act
        final call = todoRemoteDataSource.getTodos;

        //* Assert
        expect(() => call(), throwsA(exception));
      },
    );
  });

  //* This is the test for the `createTodo` method
  group('createTodo', () {
    late Response<dynamic> response;
    late Exception exception;

    setUpAll(() {
      exception = Exception();

      response = Response<dynamic>(
        data: todoDetailJson,
        requestOptions: RequestOptions(
          path: UrlConstants.todos,
        ),
      );
    });

    test(
      'should return [TodoDetailModel] when the call to remote data source is successfu',
      () async {
        //* Arrange
        when(
          mockDioClient.post(
            UrlConstants.createTodo,
            data: tTodoDetailModel.toJson(),
          ),
        ).thenAnswer((_) async => response);

        //* Act
        final result = await todoRemoteDataSource.createTodo(
          todo: tTodoDetailModel,
        );

        //* Assert
        expect(result, isA<TodoDetailModel>());
        expect(result, equals(tTodoDetailModel));
      },
    );

    test(
      'should throw an exception when the response is unsuccessful',
      () async {
        //* Arrange
        when(
          mockDioClient.post(
            UrlConstants.createTodo,
            data: tTodoDetailModel.toJson(),
          ),
        ).thenThrow(exception);

        //* Act
        final call = todoRemoteDataSource.createTodo;

        //* Assert
        expect(() => call(todo: tTodoDetailModel), throwsA(exception));
      },
    );
  });

  //* This is the test for the `updateTodo` method

  group('updateTodo', () {
    late Response<dynamic> response;
    late Exception exception;

    setUp(() {
      exception = Exception();

      response = Response<dynamic>(
        data: todoDetailJson,
        requestOptions: RequestOptions(
          path: '${UrlConstants.todos}/${tTodoDetailModel.id}',
        ),
      );
    });

    test(
      'should return a [TodoDetailModel] when the call to the data source is successful',
      () async {
        //* Arrange
        when(mockDioClient.put(
          '${UrlConstants.todos}/${tTodoDetailModel.id}',
          data: tTodoDetailModel.toJson()..remove('id'),
        )).thenAnswer(
          (_) async => response,
        );

        //* Act
        final result = await todoRemoteDataSource.updateTodo(
          todoId: tTodoDetailModel.id!,
          todo: tTodoDetailModel,
        );

        //* Assert
        expect(result, isA<TodoDetailModel>());
        expect(result, equals(tTodoDetailModel));
      },
    );

    test(
      'should throw an [Exception()] when the response is unsuccessful',
      () async {
        //* Arrange
        when(mockDioClient.put(
          '${UrlConstants.todos}/${tTodoDetailModel.id}',
          data: tTodoDetailModel.toJson()..remove('id'),
        )).thenThrow(exception);

        //* Act
        final call = todoRemoteDataSource.updateTodo;

        //* Assert
        expect(() => call(todoId: tTodoDetailModel.id!, todo: tTodoDetailModel),
            throwsA(exception));
      },
    );
  });

  //* This is the test for the `deleteTodo` method
  group('deleteTodo', () {
    late Response<dynamic> response;
    late Exception exception;

    setUp(() {
      exception = Exception();

      response = Response<dynamic>(
        data: todoDetailJson,
        requestOptions: RequestOptions(
          path: '${UrlConstants.todos}/${tTodoDetailModel.id}',
        ),
      );
    });

    test(
      'should return a [TodoDetailModel] when the call to the data source is successful',
      () async {
        //* Arrange
        when(mockDioClient.delete(
          '${UrlConstants.todos}/${tTodoDetailModel.id}',
        )).thenAnswer(
          (_) async => response,
        );

        //* Act
        final result = await todoRemoteDataSource.deleteTodo(
          todoId: tTodoDetailModel.id!,
        );

        //* Assert
        expect(result, isA<TodoDetailModel>());
        expect(result, equals(tTodoDetailModel));
      },
    );

    test(
      'should throw an [Exception()] when the response is unsuccessful',
      () async {
        //* Arrange
        when(mockDioClient.delete(
          '${UrlConstants.todos}/${tTodoDetailModel.id}',
        )).thenThrow(exception);

        //* Act
        final call = todoRemoteDataSource.deleteTodo;

        //* Assert
        expect(() => call(todoId: tTodoDetailModel.id!), throwsA(exception));
      },
    );
  });
}
