import 'package:isar/isar.dart';
import 'package:task_manager_app/data/datasources/_mappers/entity_convertable.dart';
import 'package:task_manager_app/domain/entities/auth/auth_entity.dart';

part 'auth_collection.g.dart';

@collection
class AuthCollection with EntityConvertible<AuthCollection, AuthEntity> {
  final Id? id;
  final String? accessToken;
  final String? refreshToken;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;

  const AuthCollection({
    this.accessToken,
    this.refreshToken,
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
  });

  @override
  AuthEntity toEntity() {
    return AuthEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
      id: id,
      username: username,
      email: email,
      firstName: firstName,
      lastName: lastName,
    );
  }

  @override
  AuthCollection fromEntity(AuthEntity? model) {
    return AuthCollection(
      accessToken: model?.accessToken,
      refreshToken: model?.refreshToken,
      id: model?.id,
      username: model?.username,
      email: model?.email,
      firstName: model?.firstName,
      lastName: model?.lastName,
    );
  }
}
