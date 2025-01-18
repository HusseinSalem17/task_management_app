import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../datasources/_mappers/entity_convertable.dart';
import '../../../domain/entities/todo/todo_detail_entity.dart';

part 'todo_detail_model.g.dart';

@JsonSerializable()
class TodoDetailModel extends Equatable
    with EntityConvertible<TodoDetailModel, TodoDetailEntity> {
  final int? id;
  final String? todo;
  final bool? completed;
  final int? userId;

  const TodoDetailModel({
    this.id,
    this.todo,
    this.completed,
    this.userId,
  });

  @override
  factory TodoDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TodoDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoDetailModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        todo,
        completed,
        userId,
      ];

  @override
  TodoDetailEntity toEntity() {
    return TodoDetailEntity(
      id: id,
      todo: todo,
      completed: completed,
      userId: userId,
    );
  }

  @override
  TodoDetailModel fromEntity(TodoDetailEntity? model) {
    return TodoDetailModel(
      id: model?.id,
      todo: model?.todo,
      completed: model?.completed,
      userId: model?.userId,
    );
  }
}
