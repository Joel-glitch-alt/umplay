import 'package:json_annotation/json_annotation.dart';

part 'token_user.g.dart';

@JsonSerializable()
class TokenUser {
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "first_name")
  final String? firstName;
  @JsonKey(name: "last_name")
  final String? lastName;
  @JsonKey(name: "user_uid")
  final String? userUid;
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: "isAdmin")
  final bool? isAdmin;
  @JsonKey(name: "isRestricted")
  final bool? isRestricted;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "exp")
  final int? exp;
  @JsonKey(name: "iat")
  final int? iat;

  TokenUser({
    this.email,
    this.firstName,
    this.lastName,
    this.userUid,
    this.userId,
    this.isAdmin,
    this.isRestricted,
    this.username,
    this.exp,
    this.iat,
  });

  factory TokenUser.fromJson(Map<String, dynamic> json) =>
      _$TokenUserFromJson(json);

  Map<String, dynamic> toJson() => _$TokenUserToJson(this);
}
