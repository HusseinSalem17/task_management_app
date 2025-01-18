import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:task_manager_app/core/exceptions/network/network_exception.dart';
import 'package:task_manager_app/domain/entities/export_entities.dart';
import 'package:task_manager_app/domain/usecases/export_usecases.dart';
import 'package:task_manager_app/presentation/cubit/auth/auth_cubit.dart';

import '../../_utils/mocks/mocks.mocks.dart';

void main() {
  late final AuthUsecases mockAuthUsecases;

  late final AuthEntity tAuthEntity;

  setUpAll(() {
    mockAuthUsecases = MockAuthUsecases();

    tAuthEntity = const AuthEntity(
      accessToken: String.fromEnvironment('ACCESS_TOKEN'),
      refreshToken: String.fromEnvironment('REFRESH_TOKEN'),
      username: "emilys",
      email: "emily.johnson@x.dummyjson.com",
      firstName: "Emily",
      lastName: "Johnson",
      gender: "female",
      image: "https://dummyjson.com/icon/emilys/128",
    );
  });

  //* REMOTE
  // This test is for the login method in AuthCubit
  blocTest<AuthCubit, AuthState>(
    'should emit [AuthLoading, AuthSuccess] when login is successful',
    build: () {
      provideDummy<Either<NetworkException, AuthEntity>>(Right(tAuthEntity));
      when(mockAuthUsecases.login(username: 'emilys', password: 'emilysPass'))
          .thenAnswer((_) async => Right(tAuthEntity));
      return AuthCubit(mockAuthUsecases);
    },
    act: (cubit) => cubit.login(username: 'emilys', password: 'emilysPass'),
    expect: () => [
      const AuthLoading(),
      AuthSuccess(tAuthEntity),
    ],
    verify: (_) {
      verify(mockAuthUsecases.login(username: 'emilys', password: 'emilysPass'))
          .called(1);
    },
  );
  blocTest<AuthCubit, AuthState>(
    'should emit [AuthLoading, AuthFailure] when login is unsuccessful',
    build: () {
      final dioException = DioException(
        requestOptions: RequestOptions(),
        error: const SocketException(''),
        type: DioExceptionType.connectionError,
      );
      provideDummy<Either<NetworkException, AuthEntity>>(
        Left(NetworkException.fromDioError(dioException)),
      );
      when(mockAuthUsecases.login(username: 'emilys', password: 'emilysPass'))
          .thenAnswer(
              (_) async => Left(NetworkException.fromDioError(dioException)));
      return AuthCubit(mockAuthUsecases);
    },
    act: (cubit) => cubit.login(username: 'emilys', password: 'emilysPass'),
    expect: () => [
      const AuthLoading(),
      const AuthFailure('Please check your internet connection'),    ],
    verify: (_) {
      verify(mockAuthUsecases.login(username: 'emilys', password: 'emilysPass'))
          .called(1);
    },
  );

  // This test is for the getUserData method in AuthCubit
  blocTest<AuthCubit, AuthState>(
    'should emit [AuthLoading, AuthSuccess] when getUserData is successful',
    build: () {
      provideDummy<Either<NetworkException, AuthEntity>>(Right(tAuthEntity));
      when(mockAuthUsecases.getUserData()).thenAnswer((_) async => Right(tAuthEntity));
      return AuthCubit(mockAuthUsecases);
    },
    act: (cubit) => cubit.getUserData(),
    expect: () => [
      const AuthLoading(),
      AuthSuccess(tAuthEntity),
    ],
    verify: (_) {
      verify(mockAuthUsecases.getUserData()).called(1);
    },
  );
  blocTest<AuthCubit, AuthState>(
    'should emit [AuthLoading, AuthFailure] when getUserData is unsuccessful',
    build: () {
      final dioException = DioException(
        requestOptions: RequestOptions(),
        error: const SocketException(''),
        type: DioExceptionType.connectionError,
      );
      provideDummy<Either<NetworkException, AuthEntity>>(
        Left(NetworkException.fromDioError(dioException)),
      );
      when(mockAuthUsecases.getUserData()).thenAnswer(
          (_) async => Left(NetworkException.fromDioError(dioException)));
      return AuthCubit(mockAuthUsecases);
    },
    act: (cubit) => cubit.getUserData(),
    expect: () => [
      const AuthLoading(),
      const AuthFailure('Please check your internet connection'),
    ],
    verify: (_) {
      verify(mockAuthUsecases.getUserData()).called(1);
    },
  );
}
