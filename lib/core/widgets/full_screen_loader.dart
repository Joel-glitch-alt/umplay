import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umplay/core/constants/colors_constants.dart';
import 'package:umplay/core/utils/device/device_utils.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: UDeviceUtils.isDarkMode(Get.context!)
              ? UColors.dark
              : UColors.white,
          width: double.infinity,
          height: double.infinity,
          child: const Column(
            children: [
              SizedBox(
                height: 250,
              ),
              // AnimationLoader(
              //   text: text,
              //   animation: animation,
              // ),
              CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }

  static void stopLoadingDialog() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
