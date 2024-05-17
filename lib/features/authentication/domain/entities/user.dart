class UserEntity {
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? email;
  final String? password;
  final String? phone;
  final bool? isStaff;
  final bool? isActive;
  final bool? isSuperuser;
  final bool? isVerified;
  final bool? isRestricted;
  final bool? isAdmin;
  final dynamic firstLogin;
  final dynamic lastLogin;
  final dynamic role;
  final List<dynamic>? groups;
  final List<dynamic>? userPermissions;

  UserEntity(
      this.firstName,
      this.lastName,
      this.username,
      this.email,
      this.password,
      this.phone,
      this.isStaff,
      this.isActive,
      this.isSuperuser,
      this.isVerified,
      this.isRestricted,
      this.isAdmin,
      this.firstLogin,
      this.lastLogin,
      this.role,
      this.groups,
      this.userPermissions);
}
