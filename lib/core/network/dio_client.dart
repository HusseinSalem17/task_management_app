import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:task_manager_app/presentation/cubit/auth/auth_cubit.dart';
import 'package:task_manager_app/core/constants/app_constants.dart';

/// A class that provides a wrapper around the Dio HTTP client library.
///
/// This class provides methods for making HTTP requests such as GET, POST, PUT, PATCH, and DELETE.
/// It also sets up the base URL, headers, timeouts, response type, and interceptors for the Dio client.
class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio();

    _dio
      ..options.baseUrl = AppConstants.baseUrl
      ..options.headers = {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      }
      ..options.connectTimeout = const Duration(milliseconds: 15000)
      ..options.receiveTimeout = const Duration(milliseconds: 15000)
      ..options.responseType = ResponseType.json
      ..interceptors.add(
        PrettyDioLogger(
          compact: false,
          logPrint: (object) => log(object.toString(), name: 'H.Salem Dev'),
        ),
      )
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            // Get the token from the AuthCubit
            final authCubit = GetIt.I<AuthCubit>();
            final state = authCubit.state;
            if (state is AuthSuccess) {
              final token = state.authEntity.accessToken;
              if (token != null) {
                options.headers[HttpHeaders.authorizationHeader] =
                    'Bearer $token';
              }
            }
            return handler.next(options);
          },
          onError: (DioException error, handler) async {
            // Handle token refresh logic if needed
            if (error.response?.statusCode == 401) {
              // Implement token refresh logic here if needed
            }
            return handler.next(error);
          },
        ),
      );
  }

  /// * GET
  Future<Response<dynamic>> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  /// * POST
  Future<Response<dynamic>> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  /// * PUT
  Future<Response<dynamic>> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  /// * PATCH
  Future<Response<dynamic>> patch(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  /// * DELETE
  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }
}
