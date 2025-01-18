import 'package:isar/isar.dart';
import 'package:task_manager_app/data/datasources/_mappers/entity_convertable.dart';
import 'package:task_manager_app/domain/entities/todo/todo_detail_entity.dart';

part 'todo_detail_collection.g.dart';

@collection
class TodoDetailCollection
    with EntityConvertible<TodoDetailCollection, TodoDetailEntity> {
  final Id? id;
  final String? todo;
  final bool? completed;
  final int? userId;

  const TodoDetailCollection({
    this.id,
    this.todo,
    this.completed,
    this.userId,
  });

  @override
  TodoDetailEntity toEntity() {
    return TodoDetailEntity(
      id: id,
      completed: completed,
      todo: todo,
      userId: userId,
    );
  }
}
