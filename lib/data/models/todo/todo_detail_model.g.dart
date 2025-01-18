// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoDetailModel _$TodoDetailModelFromJson(Map<String, dynamic> json) =>
    TodoDetailModel(
      id: (json['id'] as num?)?.toInt(),
      todo: json['todo'] as String?,
      completed: json['completed'] as bool?,
      userId: (json['userId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TodoDetailModelToJson(TodoDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'todo': instance.todo,
      'completed': instance.completed,
      'userId': instance.userId,
    };
