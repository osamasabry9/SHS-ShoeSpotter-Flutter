import 'package:json_annotation/json_annotation.dart';
part 'sign_in_request.g.dart';

@JsonSerializable()
class SignInRequest {

  final String email;
  final String password;

  SignInRequest(
      {
      required this.email,
      required this.password});

  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);
}
