import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:umplay/core/constants/colors_constants.dart';
import 'package:umplay/features/authentication/presentation/controllers/onboarding/onboarding_controller.dart';

import 'package:umplay/core/utils/device/device_utils.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = UDeviceUtils.isDarkMode(context);
    return ElevatedButton(
      onPressed: () => {OnboardingController.instance.nextPage()},
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: isDark ? UColors.primaryColor : Colors.black),
      child: const Icon(Iconsax.arrow_right),
    );
  }
}
