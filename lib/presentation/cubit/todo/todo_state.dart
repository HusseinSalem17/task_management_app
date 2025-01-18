part of 'todo_cubit.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoInitial extends TodoState {
  const TodoInitial();
}

final class TodoLoading extends TodoState {
  const TodoLoading();
}

final class TodoSuccess extends TodoState {
  final TodoEntity todoList;

  const TodoSuccess(this.todoList);

  @override
  List<Object> get props => [todoList];
}

final class TodoFailure extends TodoState {
  final String message;

  const TodoFailure(this.message);

  @override
  List<Object> get props => [message];
}

final class TodoDeleted extends TodoState {
  final TodoDetailEntity todo;
  const TodoDeleted(this.todo);

  @override
  List<Object> get props => [];
}

final class TodoDeletedFailure extends TodoState {
  final String message;
  const TodoDeletedFailure(this.message);

  @override
  List<Object> get props => [message];
}

final class TodoCreatedSuccess extends TodoState {
  final TodoDetailEntity todo;
  const TodoCreatedSuccess(this.todo);

  @override
  List<Object> get props => [todo];
}

final class TodoCreatedFailure extends TodoState {
  final String message;
  const TodoCreatedFailure(this.message);

  @override
  List<Object> get props => [message];
}

final class TodoUpdatedSuccess extends TodoState {
  final TodoDetailEntity todo;
  const TodoUpdatedSuccess(this.todo);

  @override
  List<Object> get props => [todo];
}

final class TodoUpdatedFailure extends TodoState {
  final String message;
  const TodoUpdatedFailure(this.message);

  @override
  List<Object> get props => [message];
}

final class TodoSavedSuccess extends TodoState {
  const TodoSavedSuccess();

  @override
  List<Object> get props => [];
}

final class TodoSavedFailure extends TodoState {
  final String message;
  const TodoSavedFailure(this.message);

  @override
  List<Object> get props => [message];
}