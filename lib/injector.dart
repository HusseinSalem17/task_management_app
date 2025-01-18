part of '../main.dart';

final injector = GetIt.instance;

Future<void> init() async {
  injector
    //* Network
    ..registerLazySingleton<DioClient>(
      () => DioClient(),
    )
    //* Database
    ..registerLazySingleton<LocalDatabase>(LocalDatabase.new)

    //* DataSources
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(injector()),
    )
    ..registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(injector<LocalDatabase>()),
    )
    ..registerLazySingleton<TodoLocalDataSource>(
      () => TodoLocalDataSourceImpl(injector<LocalDatabase>()),
    )
    ..registerLazySingleton<TodoRemoteDataSource>(
      () => TodoRemoteDataSourceImpl(injector()),
    )

    //* Repositories
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(injector(), injector()),
    )
    ..registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(injector(), injector()),
    )

    //* UseCases
    ..registerLazySingleton<AuthUsecases>(
      () => AuthUsecases(injector()),
    )
    ..registerLazySingleton<TodoUsecases>(
      () => TodoUsecases(injector()),
    )
    //* Cubits
    ..registerFactory<AuthCubit>(
      () => AuthCubit(injector()),
    )
    ..registerFactory<TodoCubit>(
      () => TodoCubit(injector<TodoUsecases>()),
    )
    ..registerFactory<ThemeCubit>(ThemeCubit.new);
}
