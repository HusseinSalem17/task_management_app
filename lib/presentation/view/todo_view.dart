import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager_app/core/components/reusable_snackbar.dart';
import 'package:task_manager_app/presentation/_widget/auth/custom_app_bar.dart';
import 'package:task_manager_app/presentation/cubit/auth/auth_cubit.dart';
import 'package:task_manager_app/presentation/cubit/todo/todo_cubit.dart';

import '../../core/constants/path_constants.dart';
import '../_widget/todo/pagination_controls.dart';
import '../_widget/todo/todo_list.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLocalDeleteSuccess) {
          context.go(PathConstants.loginView);
        } else if (state is AuthLocalDeleteFailure) {
          showReusableSnackBar(
            context,
            'Failed to delete user: ${state.message}',
          );
        }
      },
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          icon: Icon(
            Theme.of(context).brightness == Brightness.dark
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                context.read<AuthCubit>().deleteCurrentUser();
                context.go(PathConstants.loginView);
              },
            ),
          ],
          onPressed: () {},
        ),
        body: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
            if (state is TodoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TodoFailure) {
              return Center(child: Text(state.message));
            } else if (state is TodoSuccess) {
              final todo = state.todoList;
              final currentPage = (todo.skip! / todo.limit!).ceil() + 1;
              final totalPages = (todo.total! / todo.limit!).ceil();
              return Column(
                children: [
                  Expanded(
                    child: TodoList(todo: todo),
                  ),
                  paginationControls(
                    currentPage: currentPage,
                    totalPages: totalPages,
                    onPageChanged: (page) {
                      context.read<TodoCubit>().getTodosByPagination(page);
                    },
                  ),
                ],
              );
            } else {
              return const Center(child: Text('No todos available'));
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push(
              PathConstants.addTodoView,
              extra: context.read<TodoCubit>(),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
