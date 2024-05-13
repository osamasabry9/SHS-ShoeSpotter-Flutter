import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/utils/formatters/formatter.dart';

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.username,
    required super.firstName,
    required super.lastName,
    required super.phoneNumber,
    required super.email,
    required super.profileUrl,
  });
// Helper functions to get user's full name
  String get fullName => '$firstName $lastName';
// Helper functions to get user's formatted phone number
  String get formattedPhoneNumber =>
      AppFormatter.formatPhoneNumber(phoneNumber);

  /// static function to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split(' ');

// Static function to generate username from full name
  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

// static function to get initials from full name
  static UserModel empty() => const UserModel(
      uid: '',
      username: '',
      firstName: '',
      lastName: '',
      phoneNumber: '',
      email: '',
      profileUrl: '');

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        uid: data['uid'] ?? '',
        username: data['username'] ?? '',
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        email: data['email'] ?? '',
        profileUrl: data['profileUrl'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "firstName": firstName,
        "username": username,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "profileUrl": profileUrl
      };
}
