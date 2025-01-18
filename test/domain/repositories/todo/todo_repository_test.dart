import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:task_manager_app/core/exceptions/network/network_exception.dart';
import 'package:task_manager_app/data/models/export_models.dart';
import 'package:task_manager_app/data/repositories/todo/todo_repository_impl.dart';
import 'package:task_manager_app/domain/entities/export_entities.dart';
import 'package:task_manager_app/domain/repositories/export_repositories.dart';

import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late TodoRepository todoRepository;
  late MockTodoRemoteDataSource mockTodoRemoteDataSource;
  late MockTodoLocalDataSource mockTodoLocalDataSource;

  late TodoModel tTodoModel;
  late TodoDetailModel tTodoDetailModel;

  late TodoEntity tTodoEntity;
  late TodoDetailEntity tTodoDetailEntity;

  setUpAll(() {
    mockTodoRemoteDataSource = MockTodoRemoteDataSource();
    mockTodoLocalDataSource = MockTodoLocalDataSource();
    todoRepository = TodoRepositoryImpl(
      mockTodoRemoteDataSource,
      mockTodoLocalDataSource,
    );

    tTodoModel = const TodoModel(
      todos: [
        TodoDetailModel(
          id: 1,
          todo: 'Test Todo',
          completed: false,
          userId: 5,
        ),
        TodoDetailModel(
          id: 2,
          todo: "Test Todo 2",
          completed: true,
          userId: 2,
        ),
      ],
      total: 2,
      skip: 0,
      limit: 10,
    );

    tTodoEntity = const TodoEntity(
      todos: [
        TodoDetailEntity(
          id: 1,
          todo: 'Test Todo',
          completed: false,
          userId: 5,
        ),
        TodoDetailEntity(
          id: 2,
          todo: "Test Todo 2",
          completed: true,
          userId: 2,
        ),
      ],
      total: 2,
      skip: 0,
      limit: 10,
    );

    tTodoDetailModel = const TodoDetailModel(
      id: 1,
      todo: 'Updated Todo',
      completed: true,
      userId: 5,
    );

    tTodoDetailEntity = const TodoDetailEntity(
      id: 1,
      todo: 'Updated Todo',
      completed: true,
      userId: 5,
    );
  });

  //* This is the test for the method `getTodos`
  group('getTodos', () {
    final dioException = DioException(
      requestOptions: RequestOptions(),
      error: Exception(),
      response: Response(
        requestOptions: RequestOptions(),
        statusCode: 404,
        statusMessage: 'Not Found',
      ),
    );

    test(
      'should return [TodoEntity] when the call to remote data source is successful',
      () async {
        //* Arrange
        when(mockTodoRemoteDataSource.getTodos())
            .thenAnswer((_) async => tTodoModel);
        //* Act
        final result = await todoRepository.getTodos();
        //* Assert
        expect(result, equals(Right(tTodoEntity)));
        verify(mockTodoRemoteDataSource.getTodos());
        verifyNoMoreInteractions(mockTodoRemoteDataSource);
      },
    );

    test(
      'should return [NetworkException] when the call to remote data source is unsuccessful',
      () async {
        //* Arrange
        when(mockTodoRemoteDataSource.getTodos()).thenThrow(dioException);

        //* Act
        final result = await todoRepository.getTodos();

        //* Assert
        expect(
            result, equals(Left(NetworkException.fromDioError(dioException))));
        verify(mockTodoRemoteDataSource.getTodos());
        verifyNoMoreInteractions(mockTodoRemoteDataSource);
      },
    );
  });

  //* This is the test for the method `getTodosByPagination`
  group('getTodosByPagination', () {
    const limit = 10;
    const skip = 0;
    final dioException = DioException(
      requestOptions: RequestOptions(),
      error: Exception(),
      response: Response(
        requestOptions: RequestOptions(),
        statusCode: 404,
        statusMessage: 'Not Found',
      ),
    );

    test(
      'should return [TodoEntity] when the call to remote data source is successful',
      () async {
        //* Arrange
        when(mockTodoRemoteDataSource.getTodosByPagination(
          limit: limit,
          skip: skip,
        )).thenAnswer((_) async => tTodoModel);

        //* Act
        final result = await todoRepository.getTodosByPagination(
          limit: limit,
          skip: skip,
        );

        //* Assert
        expect(result, equals(Right(tTodoEntity)));
        verify(mockTodoRemoteDataSource.getTodosByPagination(
          limit: limit,
          skip: skip,
        ));
        verifyNoMoreInteractions(mockTodoRemoteDataSource);
      },
    );

    test(
      'should return [NetworkException] when the call to remote data source is unsuccessful',
      () async {
        //* Arrange
        when(mockTodoRemoteDataSource.getTodosByPagination(
          limit: limit,
          skip: skip,
        )).thenThrow(dioException);

        //* Act
        final result = await todoRepository.getTodosByPagination(
          limit: limit,
          skip: skip,
        );

        //* Assert
        expect(result, Left(NetworkException.fromDioError(dioException)));
        verify(mockTodoRemoteDataSource.getTodosByPagination(
          limit: limit,
          skip: skip,
        ));
        verifyNoMoreInteractions(mockTodoRemoteDataSource);
      },
    );
  });

  //* This is the test for the method `createTodo`
  group('createTodo', () {
    final dioException = DioException(
      requestOptions: RequestOptions(),
      error: Exception(),
      response: Response(
        requestOptions: RequestOptions(),
        statusCode: 404,
        statusMessage: 'Not Found',
      ),
    );

    test(
      'should return [TodoDetailEntity] when the call to remote data source is successful',
      () async {
        //* Arrange
        when(mockTodoRemoteDataSource.createTodo(todo: tTodoDetailModel))
            .thenAnswer((_) async => tTodoDetailModel);

        //* Act
        final result = await todoRepository.createTodo(
          todo: tTodoDetailEntity,
        );

        //* Assert
        expect(result, equals(Right(tTodoDetailEntity)));
        verify(mockTodoRemoteDataSource.createTodo(todo: tTodoDetailModel));
        verifyNoMoreInteractions(mockTodoRemoteDataSource);
      },
    );

    test(
      'should return [NetworkException] when the call to remote data source is unsuccessful',
      () async {
        //* Arrange
        when(mockTodoRemoteDataSource.createTodo(todo: tTodoDetailModel))
            .thenThrow(dioException);

        //* Act
        final result = await todoRepository.createTodo(
          todo: tTodoDetailEntity,
        );

        //* Assert
        expect(result, Left(NetworkException.fromDioError(dioException)));
        verify(mockTodoRemoteDataSource.createTodo(todo: tTodoDetailModel));
        verifyNoMoreInteractions(mockTodoRemoteDataSource);
      },
    );
  });

  //* This is the test for the method `updateTodo`
  group('updateTodo', () {
    final dioException = DioException(
      requestOptions: RequestOptions(),
      error: Exception(),
      response: Response(
        requestOptions: RequestOptions(),
        statusCode: 404,
        statusMessage: 'Not Found',
      ),
    );

    test(
      'should return [TodoDetailEntity] when the call to remote data source is successful',
      () async {
        //* Arrange
        when(mockTodoRemoteDataSource.updateTodo(
          todoId: tTodoDetailModel.id!,
          todo: tTodoDetailModel,
        )).thenAnswer((_) async => tTodoDetailModel);

        //* Act
        final result = await todoRepository.updateTodo(
          todoId: tTodoDetailEntity.id!,
          todo: tTodoDetailEntity,
        );

        //* Assert
        expect(result, equals(Right(tTodoDetailEntity)));
        verify(mockTodoRemoteDataSource.updateTodo(
          todoId: tTodoDetailModel.id!,
          todo: tTodoDetailModel,
        ));
        verifyNoMoreInteractions(mockTodoRemoteDataSource);
      },
    );

    test(
      'should return [NetworkException] when the call to remote data source is unsuccessful',
      () async {
        //* Arrange
        when(mockTodoRemoteDataSource.updateTodo(
          todoId: tTodoDetailModel.id!,
          todo: tTodoDetailModel,
        )).thenThrow(dioException);

        //* Act
        final result = await todoRepository.updateTodo(
          todoId: tTodoDetailEntity.id!,
          todo: tTodoDetailEntity,
        );

        //* Assert
        expect(result, Left(NetworkException.fromDioError(dioException)));
        verify(mockTodoRemoteDataSource.updateTodo(
          todoId: tTodoDetailModel.id!,
          todo: tTodoDetailModel,
        ));
        verifyNoMoreInteractions(mockTodoRemoteDataSource);
      },
    );
  });

  //* This is the test for the method `deleteTodo`
  group('deleteTodo', () {
    final dioException = DioException(
      requestOptions: RequestOptions(),
      error: Exception(),
      response: Response(
        requestOptions: RequestOptions(),
        statusCode: 404,
        statusMessage: 'Not Found',
      ),
    );

    test(
      'should return [tTodoDetailEntity] when the call to remote data source is successful',
      () async {
        //* Arrange
        when(mockTodoRemoteDataSource.deleteTodo(
          todoId: tTodoDetailModel.id!,
        )).thenAnswer((_) async => tTodoDetailModel);

        //* Act
        final result = await todoRepository.deleteTodo(
          todoId: tTodoDetailEntity.id!,
        );

        //* Assert
        expect(result, equals(Right(tTodoDetailEntity)));
        verify(mockTodoRemoteDataSource.deleteTodo(
          todoId: tTodoDetailModel.id!,
        ));
        verifyNoMoreInteractions(mockTodoRemoteDataSource);
      },
    );

    test(
      'should return [NetworkException] when the call to remote data source is unsuccessful',
      () async {
        //* Arrange
        when(mockTodoRemoteDataSource.deleteTodo(
          todoId: tTodoDetailModel.id!,
        )).thenThrow(dioException);

        //* Act
        final result = await todoRepository.deleteTodo(
          todoId: tTodoDetailEntity.id!,
        );

        //* Assert
        expect(result, Left(NetworkException.fromDioError(dioException)));
        verify(mockTodoRemoteDataSource.deleteTodo(
          todoId: tTodoDetailModel.id!,
        ));
        verifyNoMoreInteractions(mockTodoRemoteDataSource);
      },
    );
  });

  //TODO: Add test for local data source
}
