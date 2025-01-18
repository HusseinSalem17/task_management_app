import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:task_manager_app/core/database/local_database.dart';
import 'package:task_manager_app/data/datasources/local/_collections/export_collections.dart';
import 'package:task_manager_app/data/datasources/local/auth/auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl(this.localDatabase);

  final LocalDatabase localDatabase;

  @override
  Future<void> saveCurrentUser(AuthCollection user) {
    try {
      final db = localDatabase.db;
      return db.writeTxn(() async {
        await db.authCollections.where().deleteAll();
        await db.authCollections.put(user);
      });
    } catch (e) {
      debugPrint('saveCurrentUser auth_local_data_source_impl: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteCurrentUser() async {
    try {
      final db = localDatabase.db;
      await db.writeTxn(() async => db.authCollections.where().deleteAll());
    } catch (e) {
      debugPrint('deleteCurrentUser auth_local_data_source_impl: $e');
      rethrow;
    }
  }

  @override
  Future<AuthCollection> getCurrentUser() async {
    try {
      final db = localDatabase.db;
      final authCollection = await db.authCollections.where().findFirst();
      return authCollection!;
    } catch (e) {
      debugPrint('getCurrentUser auth_local_data_source_impl: $e');
      rethrow;
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    try {
      final db = localDatabase.db;
      final authCollection = await db.authCollections.where().findFirst();
      return authCollection != null;
    } catch (e) {
      debugPrint('isLoggedIn auth_local_data_source_impl: $e');
      rethrow;
    }
  }
}
