import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager_app/core/constants/path_constants.dart';
import 'package:task_manager_app/domain/entities/export_entities.dart';
import 'package:task_manager_app/presentation/cubit/auth/auth_cubit.dart';
import 'package:task_manager_app/presentation/view/add_todo_view.dart';
import 'package:task_manager_app/presentation/view/login_view.dart';
import 'package:task_manager_app/presentation/view/splash_view.dart';
import 'package:task_manager_app/presentation/view/todo_view.dart';

import '../../presentation/cubit/todo/todo_cubit.dart';
import '../../presentation/view/todo_detail_edit_view.dart';

final GoRouter router = GoRouter(
  initialLocation: PathConstants.splashView,
  routes: [
    GoRoute(
      path: PathConstants.splashView,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: PathConstants.loginView,
      builder: (context, state) => BlocProvider<AuthCubit>(
        create: (context) => GetIt.I<AuthCubit>(),
        child: const LoginView(),
      ),
    ),
    GoRoute(
      path: PathConstants.todoView,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) => GetIt.I<AuthCubit>(),
          ),
          BlocProvider<TodoCubit>(
            create: (context) => GetIt.I<TodoCubit>()..getTodos(),
          ),
        ],
        child: const TodoView(),
      ),
    ),
    GoRoute(
      path: PathConstants.addTodoView,
      builder: (context, state) => BlocProvider.value(
        value: GetIt.I<TodoCubit>(), // Use the same instance
        child: const AddTodoView(),
      ),
    ),
    GoRoute(
      path: PathConstants.viewAndEditTodoView,
      builder: (context, state) {
        final todo = state.extra as TodoDetailEntity;
        return BlocProvider.value(
          value: GetIt.I<TodoCubit>(), // Use the same instance
          child: TodoDetailEditView(todo: todo),
        );
      },
    ),
  ],
);
