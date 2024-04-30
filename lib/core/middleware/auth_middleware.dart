import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umplay/core/services/auth_service.dart';

class AuthMiddleware extends GetMiddleware {
  final AuthService _authService = Get.find();

  @override
  int? priority = 1;

  @override
  RouteSettings? redirect(String? route) {
    if (_authService.isFirstTime == false) {
      return null;
    } else if (_authService.accessToken.isNotEmpty) {
      return const RouteSettings(name: '/home');
    } else {
      return const RouteSettings(name: 'login');
    }
  }
}
