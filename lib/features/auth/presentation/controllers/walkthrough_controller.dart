import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:umplay/core/constants/image_constants.dart';
import 'package:umplay/core/constants/text_constants.dart';
import 'package:umplay/features/auth/data/models/walk_through_model.dart';
import 'package:umplay/features/auth/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:umplay/features/auth/presentation/screens/walk_through_screen.dart';

class WalkthroughController extends GetxController {
  final PageController pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  final deviceStorage = GetStorage();

  List<WalkThroughModel> onboardingList = [
    WalkThroughModel(
        title: UTexts.onboardingTitle1,
        description: UTexts.onboardingDescription1,
        image: UImages.onboardingImage1),
    WalkThroughModel(
        title: UTexts.onboardingTitle2,
        description: UTexts.onboardingDescription2,
        image: UImages.onboardingImage2),
    WalkThroughModel(
        title: UTexts.onboardingTitle3,
        description: UTexts.onboardingDescription3,
        image: UImages.onboardingImage3),
  ];

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    if (kDebugMode) {
      print('walkthrough');
      print(deviceStorage.read('IsFirstTime'));
    }
    FlutterNativeSplash.remove();
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const SignInScreen())
        : Get.offAll(const WalkThroughScreen());
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      deviceStorage.write('IsFirstTime', false);
      Get.offAll(const SignInScreen());
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
