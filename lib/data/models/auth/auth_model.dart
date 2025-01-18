import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:task_manager_app/data/datasources/_mappers/entity_convertable.dart';
import 'package:task_manager_app/domain/entities/auth/auth_entity.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel extends Equatable
    with EntityConvertible<AuthModel, AuthEntity> {
  final String? accessToken;
  final String? refreshToken;
  final int? id;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;

  const AuthModel({
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
  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);

  @override
  List<Object?> get props {
    return [
      accessToken,
      refreshToken,
      id,
      username,
      email,
      firstName,
      lastName
    ];
  }

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
  AuthModel fromEntity(AuthEntity model) {
    return AuthModel(
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
      id: model.id,
      username: model.username,
      email: model.email,
      firstName: model.firstName,
      lastName: model.lastName,
    );
  }
}
