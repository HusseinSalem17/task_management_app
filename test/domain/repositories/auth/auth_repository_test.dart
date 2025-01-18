import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:task_manager_app/core/exceptions/network/network_exception.dart';
import 'package:task_manager_app/data/datasources/local/auth/auth_local_data_source.dart';
import 'package:task_manager_app/data/datasources/remote/auth/auth_remote_data_source.dart';
import 'package:task_manager_app/data/models/auth/auth_model.dart';
import 'package:task_manager_app/data/repositories/auth/auth_repository_impl.dart';
import 'package:task_manager_app/domain/entities/auth/auth_entity.dart';
import 'package:task_manager_app/domain/repositories/auth/auth_repository.dart';

import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late final AuthRepository authRepository;
  late final AuthRemoteDataSource mockAuthRemoteDataSource;
  late final AuthLocalDataSource mockAuthLocalDataSource;

  late final AuthModel tAuthModel;

  late final AuthEntity tAuthEntity;

  setUpAll(
    () {
      {
        mockAuthRemoteDataSource = MockAuthRemoteDataSource();
        mockAuthLocalDataSource = MockAuthLocalDataSource();
        authRepository = AuthRepositoryImpl(
          mockAuthRemoteDataSource,
          mockAuthLocalDataSource,
        );

        tAuthModel = const AuthModel(
          accessToken: String.fromEnvironment('ACCESS_TOKEN'),
          refreshToken: String.fromEnvironment('REFRESH_TOKEN'),
          username: "emilys",
          email: "emily.johnson@x.dummyjson.com",
          firstName: "Emily",
          lastName: "Johnson",
          gender: "female",
          image: "https://dummyjson.com/icon/emilys/128",
        );

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
      }
    },
  );

  //* This is the test for the method `login`
  group(
    'login',
    () {
      final dioException = DioException(
        requestOptions: RequestOptions(),
        error: Exception(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: 404,
          statusMessage: "Not Found",
        ),
      );

      test(
        'should return AuthEntity when the call to remote data source is successful',
        () async {
          //* Arrange
          when(mockAuthRemoteDataSource.login(
            username: 'emilys',
            password: 'emilyspass',
          )).thenAnswer((_) async => tAuthModel);
          //* Act
          final result = await authRepository.login(
            username: 'emilys',
            password: 'emilyspass',
          );
          //* Assert
          expect(result, equals(Right(tAuthEntity)));
          verify(
            mockAuthRemoteDataSource.login(
              username: 'emilys',
              password: 'emilyspass',
            ),
          );
          verifyNoMoreInteractions(mockAuthRemoteDataSource);
        },
      );

      test(
        'should return [NetworkException] when the call to remote data source is unsuccessful',
        () async {
          //* Arrange
          when(mockAuthRemoteDataSource.login(
            username: 'emilyss',
            password: 'emilyspass',
          )).thenThrow(dioException);
          //* Act
          final result = await authRepository.login(
            username: 'emilyss',
            password: 'emilyspass',
          );
          //* Assert
          expect(result,
              equals(Left(NetworkException.fromDioError(dioException))));
          verify(
            mockAuthRemoteDataSource.login(
              username: 'emilyss',
              password: 'emilyspass',
            ),
          );
          verifyNoMoreInteractions(mockAuthRemoteDataSource);
        },
      );
    },
  );
}
