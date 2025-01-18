import 'package:fpdart/fpdart.dart';
import 'package:task_manager_app/core/exceptions/network/network_exception.dart';
import 'package:task_manager_app/domain/entities/auth/auth_entity.dart';
import 'package:task_manager_app/domain/repositories/auth/auth_repository.dart';

import '../../../core/exceptions/database/database_exception.dart';

class AuthUsecases {
  final AuthRepository _authRepo;

  const AuthUsecases(this._authRepo);

  ///* REMOTE
  /// Login with Username and Password
  Future<Either<NetworkException, AuthEntity>> login({
    required String username,
    required String password,
  }) async {
    return _authRepo.login(username: username, password: password);
  }

  /// Get the data of the current user
  Future<Either<NetworkException, AuthEntity>> getUserData() async {
    return _authRepo.getUserData();
  }

  ///*Local
  /// Save the data of the current user
  Future<Either<DatabaseException, void>> saveCurrentUser({
    required AuthEntity user,
  }) async {
    return _authRepo.saveCurrentUser(user: user);
  }

  /// Returns the data of the current user
  Future<Either<DatabaseException, AuthEntity>> getCurrentUser() async {
    return _authRepo.getCurrentUser();
  }

  /// Delete the current user
  Future<Either<DatabaseException, void>> deleteCurrentUser() async {
    return _authRepo.deleteCurrentUser();
  }

  /// Returns a boolean indicating if the user is logged in or not
  Future<Either<DatabaseException, bool>> isLoggedIn() async {
    return _authRepo.isLoggedIn();
  }
}
