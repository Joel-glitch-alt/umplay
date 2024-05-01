import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:umplay/core/routes/app_routes.dart';
import 'package:umplay/core/services/auth_service.dart';

class AuthMiddleware extends GetMiddleware {
  final AuthService _authService = Get.find();

  @override
  // ignore: overridden_fields
  int? priority = 1;

  @override
  RouteSettings? redirect(String? route) {
    final box = GetStorage();
    if (kDebugMode) {
      print('middleware');
      print(box.read('IsFirstTime'));
    }
    if (box.read('IsFirstTime') != true) {
      return null;
    } else if (_authService.accessToken.isNotEmpty) {
      return const RouteSettings(name: AppRoutes.home);
    } else {
      return const RouteSettings(name: AppRoutes.login);
    }
  }
}
