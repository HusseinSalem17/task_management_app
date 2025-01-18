import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_manager_app/core/constants/url_constants.dart';
import 'package:task_manager_app/core/network/dio_client.dart';
import 'package:task_manager_app/data/datasources/export_datasources.dart';
import 'package:task_manager_app/data/models/auth/auth_model.dart';

import '../../../_utils/json_reader.dart';
import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late final DioClient mockDioClient;
  late final AuthRemoteDataSourceImpl authRemoteDataSource;

  late final AuthModel tAuthModel;

  late final dynamic authJson;

  setUpAll(
    () {
      mockDioClient = MockDioClient();
      authRemoteDataSource = AuthRemoteDataSourceImpl(mockDioClient);

      authJson = jsonReader('auth_dummy_data.json');

      tAuthModel = AuthModel.fromJson(authJson as Map<String, dynamic>);
    },
  );

  //* This is the test for the method `login`
  group(
    'login',
    () {
      late final Response<dynamic> response;
      late final Exception exception;

      setUpAll(
        () {
          exception = Exception();

          response = Response<dynamic>(
            data: authJson,
            requestOptions: RequestOptions(
              path: UrlConstants.login,
            ),
          );
        },
      );

      test(
        'should return an [AuthModel] when the call to the data source is successful',
        () async {
          //* Arrange
          when(mockDioClient.post(
            UrlConstants.login,
            data: {
              'username': 'emilys',
              'password': 'emilysPass',
            },
          )).thenAnswer(
            (_) async => response,
          );

          //* Act
          final result = await authRemoteDataSource.login(
            username: 'emilys',
            password: 'emilysPass',
          );

          //* Assert
          expect(result, isA<AuthModel>());
          expect(result, equals(tAuthModel));
        },
      );

      test(
        'should throw an [Exception] when the call to the data source is unsuccessful',
        () async {
          //* Arrange
          when(mockDioClient.post(
            UrlConstants.login,
            data: {
              'username': 'emilys',
              'password': 'emilysPass',
            },
          )).thenThrow(exception);

          //* Act
          final call = authRemoteDataSource.login(
            username: 'emilys',
            password: 'emilysPass',
          );

          //* Assert
          expect(() => call, throwsException);
        },
      );
    },
  );
}
