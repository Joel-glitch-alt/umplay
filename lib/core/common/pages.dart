import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umplay/core/common/routes.dart';
import 'package:umplay/features/auth/presentation/screens/splash_screen.dart';

class AppPages {
  static const initial = AppRoutes.initial;
  static final RouteObserver<Route> observer = RouteObserver();
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.initial,
      page: () => SplashScreen(),
    ),
  ];
}
