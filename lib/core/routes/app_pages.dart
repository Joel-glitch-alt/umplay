import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umplay/core/middleware/auth_middleware.dart';
import 'package:umplay/core/routes/app_routes.dart';
import 'package:umplay/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:umplay/features/auth/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:umplay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:umplay/features/auth/presentation/screens/splash_screen.dart';
import 'package:umplay/features/screens/dashboard/dashboard_screen.dart';

class AppPages {
  const AppPages._();

  static const initial = AppRoutes.initial;
  static const login = AppRoutes.login;
  static const register = AppRoutes.register;
  static const forgotPassword = AppRoutes.forgotPassword;
  static const home = AppRoutes.home;
  static final RouteObserver<Route> observer = RouteObserver();
  static List<String> history = [];

  static final pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const SplashScreen(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const SignInScreen(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const SignUpScreen(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const DashBoardScreen(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
  ];
}
