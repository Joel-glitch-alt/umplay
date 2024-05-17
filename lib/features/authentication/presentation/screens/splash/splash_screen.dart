import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:umplay/config/theme/custom_themes/styles.dart';
import 'package:umplay/core/constants/colors_constants.dart';
import 'package:umplay/core/constants/image_constants.dart';
import 'package:umplay/core/constants/text_constants.dart';
import 'package:umplay/core/services/auth_service.dart';
import 'package:umplay/features/authentication/presentation/screens/login/login.dart';
import 'package:umplay/features/authentication/presentation/screens/onboarding_screen.dart';
import 'package:umplay/features/home/presentation/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  final AuthenticationManager _authmanager = Get.find();

  SplashScreen({super.key});

  Future<void> initializeSettings() async {
    _authmanager.checkLoginStatus();

    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    final deviceStorage = GetStorage();
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError) {
            return errorView(snapshot);
          } else {
            if (deviceStorage.read('isFirstTime') != false &&
                !_authmanager.isLogged.value) {
              return LoginScreen();
            } else if (deviceStorage.read('isFirstTime') == false &&
                !_authmanager.isLogged.value) {
              return const OnBoardingScreen();
            }
            return _authmanager.isLogged.value
                ? const HomeScreen()
                : const OnBoardingScreen();
          }
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Scaffold waitingView() {
    return Scaffold(
      body: AnimatedScrollView(
        children: [
          Image.asset(UImages.appLogo, height: 100, width: 100),
          const Positioned(
            bottom: 200,
            left: 0,
            right: 0,
            child: SpinKitCircle(color: UColors.white),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Text(UTexts.appName,
                style: Theme.of(Get.context!).copyWith().textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
