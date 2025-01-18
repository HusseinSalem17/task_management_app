import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:task_manager_app/core/components/reusable_snackbar.dart';
import 'package:task_manager_app/domain/entities/export_entities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/todo/todo_cubit.dart';
import 'todo_item.dart';

class TodoList extends StatefulWidget {
  final TodoEntity todo;

  const TodoList({
    super.key,
    required this.todo,
  });

  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  late List<TodoDetailEntity> _todos;

  @override
  void initState() {
    super.initState();
    _todos = List.from(widget.todo.todos!);
  }

  void _removeTodoAt(int index) {
    final removedTodo = _todos.removeAt(index);
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => _buildTodoItem(removedTodo, animation),
    );
  }

  Widget _buildTodoItem(TodoDetailEntity todo, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: todoItem(
        context: context,
        todo: todo,
        onDelete: () {
          final index = _todos.indexOf(todo);
          if (index != -1) {
            _removeTodoAt(index);
            GetIt.I<TodoCubit>().deleteTodo(todoId: todo.id!);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoCubit, TodoState>(
      listener: (context, state) {
        if (state is TodoDeleted) {
          // If the deletion was successful, remove the item from the list with animation
          final index = _todos.indexOf(state.todo);
          if (index != -1) {
            _removeTodoAt(index);
          }
        } else if (state is TodoDeletedFailure) {
          // If deletion failed, show a message
          showReusableSnackBar(context, state.message);
        }
      },
      child: AnimatedList(
        key: _listKey,
        initialItemCount: _todos.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index, animation) {
          return _buildTodoItem(_todos[index], animation);
        },
      ),
    );
  }
}
