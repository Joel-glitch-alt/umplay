// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenUser _$TokenUserFromJson(Map<String, dynamic> json) => TokenUser(
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      userUid: json['user_uid'] as String?,
      userId: json['user_id'] as int?,
      isAdmin: json['isAdmin'] as bool?,
      isRestricted: json['isRestricted'] as bool?,
      username: json['username'] as String?,
      exp: json['exp'] as int?,
      iat: json['iat'] as int?,
    );

Map<String, dynamic> _$TokenUserToJson(TokenUser instance) => <String, dynamic>{
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'user_uid': instance.userUid,
      'user_id': instance.userId,
      'isAdmin': instance.isAdmin,
      'isRestricted': instance.isRestricted,
      'username': instance.username,
      'exp': instance.exp,
      'iat': instance.iat,
    };
