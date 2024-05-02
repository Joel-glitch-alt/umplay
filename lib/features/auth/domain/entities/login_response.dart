import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponseEntity {
  final bool? success;
  final String? info;
  final String? token;

  LoginResponseEntity({this.success, this.info, this.token});

  factory LoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseEntityToJson(this);
}
