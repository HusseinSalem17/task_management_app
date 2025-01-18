import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:task_manager_app/domain/entities/export_entities.dart';
import 'package:task_manager_app/domain/usecases/export_usecases.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authUsecases) : super(const AuthInitial());

  final AuthUsecases _authUsecases;

  //*REMOTE
  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      emit(const AuthLoading());

      final result = await _authUsecases.login(
        username: username,
        password: password,
      );

      result.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (authEntity) => emit(AuthSuccess(authEntity)),
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> getUserData() async {
    try {
      emit(const AuthLoading());

      final result = await _authUsecases.getUserData();

      result.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (authEntity) => emit(AuthSuccess(authEntity)),
      );
    } catch (_) {
      rethrow;
    }
  }

  //*LOCAL
  Future<void> saveCurrentUser({
    required AuthEntity user,
  }) async {
    try {
      await _authUsecases.saveCurrentUser(user: user);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> getCurrentUser() async {
    try {
      emit(const AuthLoading());

      final result = await _authUsecases.getCurrentUser();

      result.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (authEntity) => emit(AuthSuccess(authEntity)),
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> deleteCurrentUser() async {
    try {
      emit(const AuthLoading());

      final result = await _authUsecases.deleteCurrentUser();

      result.fold(
        (failure) => emit(AuthLocalDeleteFailure(failure.message)),
        (_) => emit(const AuthLocalDeleteSuccess()),
      );
    } catch (_) {
      rethrow;
    }
  }
}
