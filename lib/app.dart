import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umplay/core/dependencies/bindings.dart';
import 'package:umplay/config/theme/theme.dart';
import 'package:umplay/features/authentication/presentation/screens/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'UM Play',
      themeMode: ThemeMode.system,
      theme: UThemeData.light,
      darkTheme: UThemeData.dark,
      initialBinding: AppBinding(),
      home: SplashScreen(),
    );
  }
}
