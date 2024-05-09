// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? uid;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profileUrl;
  final String? phoneNumber;

  // will not going to store in DB
  final File? imageFile;
  final String? password;


  const UserEntity({
    this.uid,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.profileUrl,
    this.phoneNumber,
    this.imageFile,
    this.password,
  });
  
  @override
  List<Object?> get props => [
    uid, username, firstName, lastName, email, profileUrl, phoneNumber, imageFile, password
  ];

}
