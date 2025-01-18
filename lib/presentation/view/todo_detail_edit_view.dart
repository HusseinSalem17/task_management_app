import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager_app/core/components/reusable_snackbar.dart';
import 'package:task_manager_app/core/components/reusable_text_field.dart';
import 'package:task_manager_app/presentation/cubit/todo/todo_cubit.dart';
import 'package:task_manager_app/domain/entities/todo/todo_detail_entity.dart';

import '../../core/components/reusable_button_widget.dart';

class TodoDetailEditView extends StatefulWidget {
  final TodoDetailEntity todo;

  const TodoDetailEditView({super.key, required this.todo});

  @override
  State<TodoDetailEditView> createState() => _TodoDetailEditViewState();
}

class _TodoDetailEditViewState extends State<TodoDetailEditView> {
  late TextEditingController todoController;
  late TextEditingController userIdController;
  final _formKey = GlobalKey<FormState>();
  bool completed = false;

  @override
  void initState() {
    super.initState();
    todoController = TextEditingController(text: widget.todo.todo);
    userIdController =
        TextEditingController(text: widget.todo.userId.toString());
    completed = widget.todo.completed!;
  }

  @override
  void dispose() {
    todoController.dispose();
    userIdController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      TodoDetailEntity updatedTodo = TodoDetailEntity(
        id: widget.todo.id,
        todo: todoController.text,
        userId: int.parse(userIdController.text),
        completed: completed,
      );

      // Use the locally provided TodoCubit
      context.read<TodoCubit>().updateTodo(
            todoId: widget.todo.id!,
            todo: updatedTodo,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Details'),
      ),
      body: BlocListener<TodoCubit, TodoState>(
        listener: (context, state) {
          if (state is TodoUpdatedSuccess) {
            debugPrint('Todo updated successfully');
            context.pop();
            showReusableSnackBar(context, 'Todo updated successfully');
          } else if (state is TodoUpdatedFailure) {
            showReusableSnackBar(context, state.message);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                ReusableTextField(
                  hintText: 'Todo',
                  controller: todoController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a todo';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                ReusableTextField(
                  hintText: 'User ID',
                  controller: userIdController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a user ID';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    const Text('Completed:'),
                    Checkbox(
                      value: completed,
                      onChanged: (value) {
                        setState(() {
                          completed = value!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                reusableButtonWidget(
                  buttonName: 'Update Todo',
                  isPrimary: true,
                  onTap: _submitForm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
