import 'package:fpdart/fpdart.dart';
import 'package:task_manager_app/core/exceptions/database/database_exception.dart';
import 'package:task_manager_app/core/exceptions/network/network_exception.dart';
import 'package:task_manager_app/domain/entities/auth/auth_entity.dart';

abstract class AuthRepository {
  //* REMOTE
  /// Login with Username and Password
  Future<Either<NetworkException, AuthEntity>> login({
    required String username,
    required String password,
  });

  /// Get the data of the current save
  Future<Either<NetworkException, AuthEntity>> getUserData();

  //*Local
  /// Save the data of the current user
  Future<Either<DatabaseException, void>> saveCurrentUser(
      {required AuthEntity? user});

  /// Returns the data of the current user
  Future<Either<DatabaseException, AuthEntity>> getCurrentUser();

  /// Delete the current user
  Future<Either<DatabaseException, void>> deleteCurrentUser();

  /// Returns a boolean indicating if the user is logged in or not
  Future<Either<DatabaseException, bool>> isLoggedIn();
}
