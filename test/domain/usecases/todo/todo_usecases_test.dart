import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:task_manager_app/core/exceptions/network/network_exception.dart';
import 'package:task_manager_app/domain/entities/export_entities.dart';
import 'package:task_manager_app/domain/usecases/todo/todo_usecases.dart';

import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late TodoUsecases todoUsecases;
  late MockTodoRepository mockTodoRepository;

  late TodoEntity tTodoEntity;
  late TodoDetailEntity tTodoDetailEntity;

  setUpAll(() {
    mockTodoRepository = MockTodoRepository();
    todoUsecases = TodoUsecases(mockTodoRepository);

    tTodoDetailEntity = const TodoDetailEntity(
      id: 1,
      todo: 'todo test',
      completed: false,
      userId: 1,
    );

    tTodoEntity = TodoEntity(
      total: 1,
      skip: 0,
      limit: 10,
      todos: [tTodoDetailEntity],
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

    setUp(() {
      provideDummy<Either<NetworkException, TodoEntity>>(Right(tTodoEntity));
      provideDummy<Either<NetworkException, TodoEntity>>(
          Left(NetworkException.fromDioError(dioException)));
    });

    test(
      'should return [TodoEntity] when the call to remote data source is successful',
      () async {
        //* Arrange
        when(mockTodoRepository.getTodos())
            .thenAnswer((_) async => Right(tTodoEntity));

        //* Act
        final result = await todoUsecases.getTodos();

        //* Assert
        expect(result, Right(tTodoEntity));
        verify(mockTodoRepository.getTodos());
        verifyNoMoreInteractions(mockTodoRepository);
      },
    );

    test(
      'should return [NetworkException] when the call to remote data source is unsuccessful',
      () async {
        //* Arrange
        when(mockTodoRepository.getTodos()).thenAnswer(
            (_) async => Left(NetworkException.fromDioError(dioException)));

        //* Act
        final result = await todoUsecases.getTodos();

        //* Assert
        expect(result, Left(NetworkException.fromDioError(dioException)));
        verify(mockTodoRepository.getTodos());
        verifyNoMoreInteractions(mockTodoRepository);
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

    setUp(() {
      provideDummy<Either<NetworkException, TodoEntity>>(Right(tTodoEntity));
      provideDummy<Either<NetworkException, TodoEntity>>(
          Left(NetworkException.fromDioError(dioException)));
    });

    test(
      'should return [TodoEntity] when the call to remote data source is successful',
      () async {
        //* Arrange
        when(mockTodoRepository.getTodosByPagination(
          limit: limit,
          skip: skip,
        )).thenAnswer((_) async => Right(tTodoEntity));

        //* Act
        final result = await todoUsecases.getTodosByPagination(
          limit: limit,
          skip: skip,
        );

        //* Assert
        expect(result, Right(tTodoEntity));
        verify(mockTodoRepository.getTodosByPagination(
          limit: limit,
          skip: skip,
        ));
        verifyNoMoreInteractions(mockTodoRepository);
      },
    );

    test(
      'should return [NetworkException] when the call to remote data source is unsuccessful',
      () async {
        //* Arrange
        when(mockTodoRepository.getTodosByPagination(
          limit: limit,
          skip: skip,
        )).thenAnswer(
            (_) async => Left(NetworkException.fromDioError(dioException)));

        //* Act
        final result = await todoUsecases.getTodosByPagination(
          limit: limit,
          skip: skip,
        );

        //* Assert
        expect(result, Left(NetworkException.fromDioError(dioException)));
        verify(mockTodoRepository.getTodosByPagination(
          limit: limit,
          skip: skip,
        ));
        verifyNoMoreInteractions(mockTodoRepository);
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

    setUp(() {
      provideDummy<Either<NetworkException, TodoDetailEntity>>(
          Right(tTodoDetailEntity));
      provideDummy<Either<NetworkException, TodoDetailEntity>>(
          Left(NetworkException.fromDioError(dioException)));
    });

    test(
      'should return [TodoDetailEntity] when the call to remote data source is successful',
      () async {
        //* Arrange
        when(mockTodoRepository.createTodo(
          todo: tTodoDetailEntity,
        )).thenAnswer((_) async => Right(tTodoDetailEntity));

        //* Act
        final result = await todoUsecases.createTodo(
          todo: tTodoDetailEntity,
        );

        //* Assert
        expect(result, Right(tTodoDetailEntity));
        verify(mockTodoRepository.createTodo(todo: tTodoDetailEntity));
        verifyNoMoreInteractions(mockTodoRepository);
      },
    );

    test(
      'should return [NetworkException] when the call to remote data source is unsuccessful',
      () async {
        //* Arrange
        when(mockTodoRepository.createTodo(
          todo: tTodoDetailEntity,
        )).thenAnswer(
            (_) async => Left(NetworkException.fromDioError(dioException)));

        //* Act
        final result = await todoUsecases.createTodo(
          todo: tTodoDetailEntity,
        );

        //* Assert
        expect(result, Left(NetworkException.fromDioError(dioException)));
        verify(mockTodoRepository.createTodo(todo: tTodoDetailEntity));
        verifyNoMoreInteractions(mockTodoRepository);
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

    setUp(() {
      provideDummy<Either<NetworkException, TodoDetailEntity>>(
          Right(tTodoDetailEntity));
      provideDummy<Either<NetworkException, TodoDetailEntity>>(
          Left(NetworkException.fromDioError(dioException)));
    });

    test(
      'should return [TodoDetailEntity] when the call to remote data source is successful',
      () async {
        //* Arrange
        when(mockTodoRepository.updateTodo(
          todoId: tTodoDetailEntity.id!,
          todo: tTodoDetailEntity,
        )).thenAnswer((_) async => Right(tTodoDetailEntity));

        //* Act
        final result = await todoUsecases.updateTodo(
          todoId: tTodoDetailEntity.id!,
          todo: tTodoDetailEntity,
        );

        //* Assert
        expect(result, Right(tTodoDetailEntity));
        verify(mockTodoRepository.updateTodo(
          todoId: tTodoDetailEntity.id!,
          todo: tTodoDetailEntity,
        ));
        verifyNoMoreInteractions(mockTodoRepository);
      },
    );

    test(
      'should return [NetworkException] when the call to remote data source is unsuccessful',
      () async {
        //* Arrange
        when(mockTodoRepository.updateTodo(
          todoId: tTodoDetailEntity.id!,
          todo: tTodoDetailEntity,
        )).thenAnswer(
            (_) async => Left(NetworkException.fromDioError(dioException)));

        //* Act
        final result = await todoUsecases.updateTodo(
          todoId: tTodoDetailEntity.id!,
          todo: tTodoDetailEntity,
        );

        //* Assert
        expect(result, Left(NetworkException.fromDioError(dioException)));
        verify(mockTodoRepository.updateTodo(
          todoId: tTodoDetailEntity.id!,
          todo: tTodoDetailEntity,
        ));
        verifyNoMoreInteractions(mockTodoRepository);
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

    setUp(() {
      provideDummy<Either<NetworkException, TodoDetailEntity>>(
          Right(tTodoDetailEntity));
      provideDummy<Either<NetworkException, TodoDetailEntity>>(
          Left(NetworkException.fromDioError(dioException)));
    });

    test(
      'should return [Unit] when the call to remote data source is successful',
      () async {
        //* Arrange
        when(mockTodoRepository.deleteTodo(
          todoId: tTodoDetailEntity.id!,
        )).thenAnswer((_) async => Right(tTodoDetailEntity));

        //* Act
        final result = await todoUsecases.deleteTodo(
          todoId: tTodoDetailEntity.id!,
        );

        //* Assert
        expect(result, Right(tTodoDetailEntity));
        verify(mockTodoRepository.deleteTodo(
          todoId: tTodoDetailEntity.id!,
        ));
        verifyNoMoreInteractions(mockTodoRepository);
      },
    );

    test(
      'should return [NetworkException] when the call to remote data source is unsuccessful',
      () async {
        //* Arrange
        when(mockTodoRepository.deleteTodo(
          todoId: tTodoDetailEntity.id!,
        )).thenAnswer(
            (_) async => Left(NetworkException.fromDioError(dioException)));

        //* Act
        final result = await todoUsecases.deleteTodo(
          todoId: tTodoDetailEntity.id!,
        );

        //* Assert
        expect(result, Left(NetworkException.fromDioError(dioException)));
        verify(mockTodoRepository.deleteTodo(
          todoId: tTodoDetailEntity.id!,
        ));
        verifyNoMoreInteractions(mockTodoRepository);
      },
    );
  });
}
