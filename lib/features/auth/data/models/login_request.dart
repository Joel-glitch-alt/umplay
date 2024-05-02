import 'package:json_annotation/json_annotation.dart';
import 'package:umplay/features/auth/domain/entities/login_request.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequestModel extends LoginRequestEntity {
  LoginRequestModel({required super.phone, required super.password});

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
