import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import "package:get_storage/get_storage.dart";
import 'package:umplay/features/authentication/presentation/screens/login/login.dart';
import 'package:umplay/features/authentication/presentation/screens/onboarding/widgets/onboarding_next_button.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //
  final deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //

  // @override
  // void onInit() {
  //   super.onInit();
  // }
  //

  screenRedirect() async {
    //
    if (kDebugMode) {
      print(
          '============================= GET STORAGE AUTH Repo ===========================');
      print(deviceStorage.read('IsFirstTime'));
    }

    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => LoginScreen())
        : Get.offAll(const OnBoardingNextButton());
  }
}
