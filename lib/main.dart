import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_manager_app/data/datasources/export_datasources.dart';
import 'package:task_manager_app/domain/usecases/export_usecases.dart';

import 'config/router/app_router.dart';
import 'core/database/local_database.dart';
import 'core/network/dio_client.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/cubit/theme_cubit.dart';
import 'data/repositories/export_repository_impls.dart';
import 'domain/repositories/export_repositories.dart';
import 'presentation/cubit/auth/auth_cubit.dart';
import 'presentation/cubit/todo/todo_cubit.dart';

part 'injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await init();
  await injector<LocalDatabase>().initialize();
  final directory = await getApplicationDocumentsDirectory();
  HydratedBloc.storage =
      await HydratedStorage.build(storageDirectory: directory);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (context) => injector<ThemeCubit>(),
      child: ScreenUtilInit(
        builder: (context, child) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return MaterialApp.router(
                themeMode: themeState.themeMode,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                routerConfig: router,
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }
}
