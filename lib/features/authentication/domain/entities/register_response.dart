// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterResponseEntity {
  final bool? success;
  final String? info;
  RegisterResponseEntity({
    this.success,
    this.info,
  });

  RegisterResponseEntity copyWith({
    bool? success,
    String? info,
  }) {
    return RegisterResponseEntity(
      success: success ?? this.success,
      info: info ?? this.info,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'info': info,
    };
  }

  factory RegisterResponseEntity.fromMap(Map<String, dynamic> map) {
    return RegisterResponseEntity(
      success: map['success'] != null ? map['success'] as bool : null,
      info: map['info'] != null ? map['info'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterResponseEntity.fromJson(String source) =>
      RegisterResponseEntity.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RegisterResponseEntity(success: $success, info: $info)';

  @override
  bool operator ==(covariant RegisterResponseEntity other) {
    if (identical(this, other)) return true;

    return other.success == success && other.info == info;
  }

  @override
  int get hashCode => success.hashCode ^ info.hashCode;
}
