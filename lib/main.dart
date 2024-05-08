import 'package:cloudinary_flutter/cloudinary_context.dart';
import 'package:cloudinary_flutter/cloudinary_object.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:umplay/app_theme.dart';
import 'package:umplay/core/dependencies/bindings.dart';
import 'package:umplay/core/routes/app_pages.dart';
import 'package:umplay/core/routes/app_routes.dart';
import 'package:umplay/features/auth/presentation/screens/splash_screen.dart';
import 'package:umplay/core/store/app_store.dart';

// APP STORE
AppStore appStore = AppStore();

Future<void> main() async {
  final widgetBinded = WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinded);

  CloudinaryObject.fromCloudName(cloudName: 'dexc98myq');

  await AppBinding().dependencies();

  textPrimaryColorGlobal = Colors.white;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      // themeMode: appStore.isDarkMode ? ThemeMode.dark : ThemeMode.light,

      title: 'UM Play',
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: AppBinding(),
      initialRoute: AppRoutes.initial,
      getPages: AppPages.pages,
      home: const SplashScreen(),
    );
  }
}
