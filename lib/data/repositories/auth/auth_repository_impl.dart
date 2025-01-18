import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';
import 'package:task_manager_app/core/exceptions/database/database_exception.dart';
import 'package:task_manager_app/core/exceptions/network/network_exception.dart';
import 'package:task_manager_app/data/datasources/export_datasources.dart';
import 'package:task_manager_app/data/datasources/local/_collections/export_collections.dart';
import 'package:task_manager_app/domain/entities/export_entities.dart';
import 'package:task_manager_app/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource, this._authLocalDataSource);

  //* REMOTE
  @override
  Future<Either<NetworkException, AuthEntity>> login(
      {required String username, required String password}) async {
    try {
      final result = await _authRemoteDataSource.login(
          username: username, password: password);
      return Right(result.toEntity());
    } on DioException catch (e) {
      debugPrint('login auth_repository_impl: $e');
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, AuthEntity>> getUserData() async {
    try {
      final result = await _authRemoteDataSource.getUserData();
      return Right(result.toEntity());
    } on DioException catch (e) {
      debugPrint('getUserData auth_repository_impl: $e');
      return Left(NetworkException.fromDioError(e));
    }
  }

  //* LOCAL
  @override
  Future<Either<DatabaseException, void>> saveCurrentUser(
      {required AuthEntity? user}) async {
    try {
      final result = await _authLocalDataSource
          .saveCurrentUser(const AuthCollection().fromEntity(user));
      return Right(result);
    } on IsarError catch (e) {
      debugPrint('saveCurrentUser auth_repository_impl: $e');
      return Left(DatabaseException.fromIsarError(e));
    }
  }

  @override
  Future<Either<DatabaseException, void>> deleteCurrentUser() async {
    try {
      final result = await _authLocalDataSource.deleteCurrentUser();
      return Right(result);
    } on IsarError catch (e) {
      debugPrint('deleteCurrentUser auth_repository_impl: $e');
      return Left(DatabaseException.fromIsarError(e));
    }
  }

  @override
  Future<Either<DatabaseException, AuthEntity>> getCurrentUser() async {
    try {
      final result = await _authLocalDataSource.getCurrentUser();
      return Right(result.toEntity());
    } on IsarError catch (e) {
      debugPrint('getCurrentUser auth_repository_impl: $e');
      return Left(DatabaseException.fromIsarError(e));
    }
  }

  @override
  Future<Either<DatabaseException, bool>> isLoggedIn() async {
    try {
      final result = await _authLocalDataSource.isLoggedIn();
      return Right(result);
    } on IsarError catch (e) {
      debugPrint('isLoggedIn auth_repository_impl: $e');
      return Left(DatabaseException.fromIsarError(e));
    }
  }
}
