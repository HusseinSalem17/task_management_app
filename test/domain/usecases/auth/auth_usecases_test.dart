import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:task_manager_app/core/exceptions/network/network_exception.dart';
import 'package:task_manager_app/domain/entities/export_entities.dart';
import 'package:task_manager_app/domain/repositories/export_repositories.dart';
import 'package:task_manager_app/domain/usecases/export_usecases.dart';

import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late final AuthRepository mockAuthRepository;
  late final AuthUsecases mockAuthUsecases;

  late final AuthEntity tAuthEntity;

  setUpAll(
    () {
      mockAuthRepository = MockAuthRepository();
      mockAuthUsecases = AuthUsecases(mockAuthRepository);

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
            statusMessage: 'Not Found'),
      );

      setUp(
        () {
          provideDummy<Either<NetworkException, AuthEntity>>(
              Right(tAuthEntity));
          provideDummy<Either<NetworkException, AuthEntity>>(Left(
            NetworkException.fromDioError(dioException),
          ));
        },
      );

      test(
        'should return an [AuthEntity] when the call to the data source is successful',
        () async {
          //* Arrange
          when(mockAuthRepository.login(
            username: 'emilys',
            password: 'emilysPass',
          )).thenAnswer(
            (_) async => Right(tAuthEntity),
          );

          //* Act
          final result = await mockAuthUsecases.login(
            username: 'emilys',
            password: 'emilysPass',
          );

          //* Assert
          expect(result, Right(tAuthEntity));
          verify(
            mockAuthRepository.login(
              username: 'emilys',
              password: 'emilysPass',
            ),
          );
          verifyNoMoreInteractions(mockAuthRepository);
        },
      );

      test(
        'should return a [NetworkException] when the call to the data source is unsuccessful',
        () async {
          //* Arrange
          when(mockAuthRepository.login(
            username: 'emilys',
            password: 'emilysPass',
          )).thenAnswer(
            (_) async => Left(
              NetworkException.fromDioError(dioException),
            ),
          );

          //* Act
          final result = await mockAuthRepository.login(
            username: 'emilys',
            password: 'emilysPass',
          );

          //* Assert
          expect(
            result,
            Left(
              NetworkException.fromDioError(dioException),
            ),
          );
          verify(
            mockAuthRepository.login(
              username: 'emilys',
              password: 'emilysPass',
            ),
          );
          verifyNoMoreInteractions(mockAuthRepository);
        },
      );
    },
  );
}
