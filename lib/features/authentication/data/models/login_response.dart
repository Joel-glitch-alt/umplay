import 'package:umplay/features/authentication/domain/entities/login_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponseModel extends LoginResponseEntity {
  LoginResponseModel({super.success, super.info, super.token});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
