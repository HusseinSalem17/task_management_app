import 'package:isar/isar.dart';
import 'package:task_manager_app/data/datasources/_mappers/entity_convertable.dart';
import 'package:task_manager_app/data/datasources/local/_collections/todo/todo_detail_collection.dart';
import 'package:task_manager_app/domain/entities/todo/todo_entity.dart';

part 'todo_collection.g.dart';

@collection
class TodoCollection with EntityConvertible<TodoCollection, TodoEntity> {
  final Id? id = Isar.autoIncrement;
  final int? total;
  final int? skip;
  final int? limit;
  final IsarLinks<TodoDetailCollection> todos =
      IsarLinks<TodoDetailCollection>();

  TodoCollection({
    this.total,
    this.skip,
    this.limit,
  });

  @override
  TodoEntity toEntity() {
    return TodoEntity(
      total: total,
      skip: skip,
      limit: limit,
      todos: todos.map((todoLink) => todoLink.toEntity()).toList(),
    );
  }

  @override
  TodoCollection fromEntity(TodoEntity model) {
    final collection = TodoCollection(
      total: model.total,
      skip: model.skip,
      limit: model.limit,
    );
    if (model.todos != null) {
      for (var todo in model.todos!) {
        final todoLink = const TodoDetailCollection().fromEntity(todo);
        collection.todos.add(todoLink);
      }
    }
    return collection;
  }
}
