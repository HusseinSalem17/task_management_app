import '../_collections/export_collections.dart';

abstract class AuthLocalDataSource {
  const AuthLocalDataSource();

  // Save the data of the current user
  Future<void> saveCurrentUser(AuthCollection user);

  // Returns the data of the current user
  Future<AuthCollection> getCurrentUser();

  // Delete the current user
  Future<void> deleteCurrentUser();

  // Returns a boolean indicating if the user is logged in or not
  Future<bool> isLoggedIn();
}
