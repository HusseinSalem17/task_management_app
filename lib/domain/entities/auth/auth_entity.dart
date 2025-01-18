import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final int? id;
  final String? accessToken;
  final String? refreshToken;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;

  const AuthEntity({
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
}
