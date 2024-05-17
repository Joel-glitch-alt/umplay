import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:umplay/core/constants/colors_constants.dart';
import 'package:umplay/features/authentication/presentation/controllers/onboarding/onboarding_controller.dart';
import 'package:umplay/core/utils/device/device_utils.dart';

class OnBoardingIndicator extends StatelessWidget {
  const OnBoardingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;

    final isDark = UDeviceUtils.isDarkMode(context);
    return SmoothPageIndicator(
      controller: controller.pageController,
      onDotClicked: controller.updatePageIndicator,
      count: controller.onboardingList.length,
      effect: ExpandingDotsEffect(
          activeDotColor: isDark ? UColors.primaryColor : UColors.primaryColor,
          dotHeight: 8),
    );
  }
}
