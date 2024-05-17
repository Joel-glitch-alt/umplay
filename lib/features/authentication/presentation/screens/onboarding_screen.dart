import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:umplay/core/constants/sizes.dart';
import 'package:umplay/features/authentication/presentation/controllers/onboarding/onboarding_controller.dart';
import 'package:umplay/features/authentication/presentation/screens/onboarding/widgets/onboarding_indicator.dart';
import 'package:umplay/features/authentication/presentation/screens/onboarding/widgets/onboarding_page.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF3594DD),
                Color(0xFF4563DB),
                Color(0xFF5036D5),
                Color(0xFF5B16D0),
              ],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: controller.pageController,
                  onPageChanged: controller.updatePageIndicator,
                  itemCount: controller.onboardingList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(USizes.defaultSpace),
                      child: Column(
                        children: [
                          OnBoardingPage(
                            image: controller.onboardingList[index].image,
                            title: controller.onboardingList[index].title,
                            description:
                                controller.onboardingList[index].description,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OnBoardingIndicator(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: USizes.spaceBetweenItems,
                    ),
                    TextButton.icon(
                      onPressed: () =>
                          {OnboardingController.instance.nextPage()},
                      icon: const Icon(Icons.arrow_right),
                      label: const Text('Next'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
