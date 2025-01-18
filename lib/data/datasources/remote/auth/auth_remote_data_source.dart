import '../../../models/auth/auth_model.dart';

abstract class AuthRemoteDataSource {
  /// Returns the data of the current user
  Future<AuthModel> getUserData();

  /// Logs in the user
  Future<AuthModel> login({required String username, required String password});
}
