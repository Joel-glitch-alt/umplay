// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestEntity _$LoginRequestEntityFromJson(Map<String, dynamic> json) =>
    LoginRequestEntity(
      phone: json['phone'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestEntityToJson(LoginRequestEntity instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'password': instance.password,
    };
