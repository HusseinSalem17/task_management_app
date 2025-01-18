import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:task_manager_app/domain/entities/export_entities.dart';

import '../../datasources/_mappers/entity_convertable.dart';
import 'todo_detail_model.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel extends Equatable
    with EntityConvertible<TodoModel, TodoEntity> {
  final List<TodoDetailModel>? todos;
  final int? total;
  final int? skip;
  final int? limit;

  const TodoModel({
    this.todos,
    this.total,
    this.skip,
    this.limit,
  });

  @override
  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);

  @override
  List<Object?> get props => [todos, total, skip, limit];

  @override
  TodoEntity toEntity() {
    return TodoEntity(
      todos: todos?.map((todo) => todo.toEntity()).toList(),
      total: total,
      skip: skip,
      limit: limit,
    );
  }

  @override
  TodoModel fromEntity(TodoEntity? model) {
    return TodoModel(
      todos: model?.todos
          ?.map((todo) => const TodoDetailModel().fromEntity(todo))
          .toList(),
      total: model?.total,
      skip: model?.skip,
      limit: model?.limit,
    );
  }
}
