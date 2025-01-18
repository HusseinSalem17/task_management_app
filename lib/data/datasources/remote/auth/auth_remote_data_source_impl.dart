import 'package:flutter/material.dart';
import 'package:task_manager_app/core/constants/url_constants.dart';
import 'package:task_manager_app/core/network/dio_client.dart';
import 'package:task_manager_app/data/datasources/remote/auth/auth_remote_data_source.dart';

import '../../../models/auth/auth_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _dioClient;

  const AuthRemoteDataSourceImpl(this._dioClient);

  /// Returns the data of the current user
  @override
  Future<AuthModel> getUserData() async {
    try {
      final response = await _dioClient.get(
        UrlConstants.user,
      );
      final model = AuthModel.fromJson(response.data);
      return model;
    } catch (e) {
      debugPrint('getUserData auth_remote_data_source_impl: $e');
      rethrow;
    }
  }

  /// Logs in the user
  @override
  Future<AuthModel> login(
      {required String username, required String password}) async {
    try {
      final response = await _dioClient.post(UrlConstants.login, data: {
        'username': username,
        'password': password,
      });
      final model = AuthModel.fromJson(response.data);
      return model;
    } catch (e) {
      debugPrint('login auth_remote_data_source_impl: $e');
      rethrow;
    }
  }
}
