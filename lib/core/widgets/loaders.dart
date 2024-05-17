import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:umplay/core/constants/colors_constants.dart';

class Loaders {
  static void showWarning({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: UColors.white,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(
          20,
        ),
        icon: const Icon(
          Iconsax.warning_2,
          color: UColors.white,
        ));
  }

  static void showError({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: UColors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(
          20,
        ),
        icon: const Icon(
          Iconsax.warning_2,
          color: UColors.white,
        ));
  }

  static void showSuccess({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: UColors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(
          20,
        ),
        icon: const Icon(
          Iconsax.check,
          color: UColors.white,
        ));
  }
}
