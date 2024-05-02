// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterRequsetEntity {
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? password;
  String? phoneNumber;
  RegisterRequsetEntity({
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.password,
    this.phoneNumber,
  });

  RegisterRequsetEntity copyWith({
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? password,
    String? phoneNumber,
  }) {
    return RegisterRequsetEntity(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
    };
  }

  factory RegisterRequsetEntity.fromMap(Map<String, dynamic> map) {
    return RegisterRequsetEntity(
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterRequsetEntity.fromJson(String source) =>
      RegisterRequsetEntity.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegisterRequsetEntity(firstName: $firstName, lastName: $lastName, username: $username, email: $email, password: $password, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(covariant RegisterRequsetEntity other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.username == username &&
        other.email == email &&
        other.password == password &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        username.hashCode ^
        email.hashCode ^
        password.hashCode ^
        phoneNumber.hashCode;
  }
}
