import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;

  SignUpRequest(
      {required this.username,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.password});

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
