import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequestEntity {
  final String phone;
  final String password;
  LoginRequestEntity({
    required this.phone,
    required this.password,
  });

  factory LoginRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestEntityToJson(this);
}
