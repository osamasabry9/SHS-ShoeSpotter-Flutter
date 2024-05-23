// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String username;
  String firstName;
  String lastName;
  String phoneNumber;
  final String email;
  String profileUrl;

  UserEntity({
    this.uid = '',
    this.username = '',
    this.firstName = '',
    this.lastName = '',
    this.phoneNumber = '',
    this.email = '',
    this.profileUrl = '',
  });

  UserEntity copyWith({
    String? uid,
    String? username,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
    String? profileUrl,
  }) {
    return UserEntity(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      profileUrl: profileUrl ?? this.profileUrl,
    );
  }

  @override
  List<Object?> get props =>
      [uid, username, firstName, lastName, phoneNumber, email, profileUrl];
}
