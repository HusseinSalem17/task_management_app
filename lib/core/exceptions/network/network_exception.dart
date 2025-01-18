import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class NetworkException extends Failure implements Exception {
  final int? statusCode;

  const NetworkException(super.message, {this.statusCode});

  factory NetworkException.fromDioError(DioException dioException) {
    String message;
    int? statusCode = dioException.response?.statusCode;

    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;

      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;

      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;

      case DioExceptionType.connectionError:
        if (dioException.error is SocketException) {
          message = 'Please check your internet connection';
        } else {
          message = 'Unexpected error occurred';
        }
        break;

      case DioExceptionType.badCertificate:
        message = 'Bad Certificate';
        break;

      case DioExceptionType.badResponse:
        message = _handleStatusCode(statusCode, dioException.response?.data);
        break;

      case DioExceptionType.unknown:
        if (dioException.message?.contains('SocketException') ?? false) {
          message = 'No Internet Connection';
        } else {
          message = 'Unexpected error occurred';
        }
        break;

      default:
        message = 'Oops, there was an error. Please try again';
        break;
    }

    return NetworkException(message, statusCode: statusCode);
  }

  factory NetworkException.fromResponse(int statusCode, dynamic response) {
    return NetworkException(_handleStatusCode(statusCode, response),
        statusCode: statusCode);
  }

  static String _handleStatusCode(int? statusCode, dynamic response) {
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return response['message'] ?? 'Unauthorized request';
      case 404:
        return 'Your request was not found. Please try again later!';
      case 500:
        return 'Internal server error. Please try later!';
      default:
        return 'Oops, there was an error. Please try again';
    }
  }

  @override
  List<Object?> get props => [message, statusCode];
}
