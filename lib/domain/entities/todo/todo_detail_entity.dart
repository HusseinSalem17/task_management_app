import 'package:equatable/equatable.dart';

class TodoDetailEntity extends Equatable {
  final int? id;
  final String? todo;
  final bool? completed;
  final int? userId;

  const TodoDetailEntity({
    this.id,
    this.todo,
    this.completed,
    this.userId,
  });

  @override
  List<Object?> get props => [id, todo, completed, userId];
}
