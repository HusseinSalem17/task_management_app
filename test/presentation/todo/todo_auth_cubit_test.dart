import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:task_manager_app/core/exceptions/network/network_exception.dart';
import 'package:task_manager_app/domain/entities/export_entities.dart';
import 'package:task_manager_app/presentation/cubit/todo/todo_cubit.dart';

import '../../_utils/mocks/mocks.mocks.dart';

void main() async {
  // Ensure the Flutter binding is initialized
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockTodoUsecases mockTodoUsecases;

  const tTodoDetailEntity = TodoDetailEntity(
    id: 1,
    todo: 'todo test',
    completed: false,
    userId: 2,
  );

  const tTodoEntity = TodoEntity(
    todos: [tTodoDetailEntity],
    skip: 0,
    total: 1,
    limit: 10,
  );

  setUp(() {
    mockTodoUsecases = MockTodoUsecases();
  });

  blocTest<TodoCubit, TodoState>(
    "should emit [TodoLoading, TodoSuccess] when getTodos is successful",
    build: () {
            provideDummy<Either<NetworkException, TodoEntity>>(const Right(tTodoEntity));
      when(mockTodoUsecases.getTodos())
          .thenAnswer((_) async => const Right(tTodoEntity));
      return TodoCubit(mockTodoUsecases);
    },
    act: (cubit) => cubit.getTodos(),
    expect: () => [
      const TodoLoading(),
      const TodoSuccess(tTodoEntity),
    ],
    verify: (_) {
      verify(mockTodoUsecases.getTodos()).called(1);
    },
  );
}
