import 'package:equatable/equatable.dart';
import 'package:task_manager_app/domain/entities/todo/todo_detail_entity.dart';

class TodoEntity extends Equatable {
  final List<TodoDetailEntity>? todos;
  final int? total;
  final int? skip;
  final int? limit;

  const TodoEntity({
    this.todos,
    this.total,
    this.skip,
    this.limit,
  });

  @override
  List<Object?> get props => [todos, total, skip, limit];
}
