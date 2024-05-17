import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:umplay/core/constants/image_constants.dart';
import 'package:umplay/core/constants/text_constants.dart';

import 'package:umplay/features/authentication/data/models/onboarding.dart';
import 'package:get_storage/get_storage.dart';
import 'package:umplay/features/authentication/presentation/screens/login/login.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();
  final PageController pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  List<Onboarding> onboardingList = [
    Onboarding(
        title: UTexts.onboardingTitle1,
        description: UTexts.onboardingDescription1,
        image: UImages.onboardingImage1),
    Onboarding(
        title: UTexts.onboardingTitle2,
        description: UTexts.onboardingDescription2,
        image: UImages.onboardingImage2),
    Onboarding(
        title: UTexts.onboardingTitle3,
        description: UTexts.onboardingDescription3,
        image: UImages.onboardingImage3),
  ];

  final deviceStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    FlutterNativeSplash.remove();

    // screenRedirect();
  }

  // screenRedirect() {
  //   deviceStorage.writeIfNull('isFirstTime', true);
  //   if (deviceStorage.read('IsFirstTime') != false) {
  //     Get.offAll(LoginScreen());
  //   } else {
  //     Get.offAll(const OnBoardingScreen());
  //   }
  // }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      deviceStorage.write('IsFirstTime', false);
      Get.offAll(LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void updatePageIndicator(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }
}
