import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String username;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String profileUrl;

  const UserEntity({
    required this.uid,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.profileUrl,
  });

  @override
  List<Object?> get props => [
        uid,
        username,
        firstName,
        lastName,
        phoneNumber,
        email,
        profileUrl
  ];
}
