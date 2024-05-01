import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:umplay/core/components/app_scaffold.dart';
import 'package:umplay/core/components/common_app_button.dart';
import 'package:umplay/core/constants/colors.dart';
import 'package:umplay/core/routes/app_routes.dart';
import 'package:umplay/core/utils/device/device_utils.dart';
import 'package:umplay/features/auth/presentation/controllers/walkthrough_controller.dart';

class WalkThroughScreen extends StatelessWidget {
  const WalkThroughScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WalkthroughController());

    return AppScaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: controller.pageController,
            itemCount: controller.onboardingList.length,
            onPageChanged: (index) {
              controller.updatePageIndicator(index);
            },
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  100.height,
                  Image.asset(controller.onboardingList[index].image.validate(),
                      height: UDeviceUtils.getScreenHeight(context) * 0.4,
                      width: UDeviceUtils.getScreenWidth(context)),
                  60.height,
                  Text(controller.onboardingList[index].title.validate(),
                          style: boldTextStyle(
                              size: 24, color: textPrimaryColorGlobal),
                          textAlign: TextAlign.center)
                      .paddingSymmetric(horizontal: 60),
                  16.height,
                  if (controller.currentPageIndex.value !=
                      controller.onboardingList.length)
                    Text(
                            controller.onboardingList[index].description
                                .validate(),
                            style: secondaryTextStyle(),
                            textAlign: TextAlign.center,
                            maxLines: 2)
                        .paddingSymmetric(horizontal: 60),
                ],
              );
            },
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: DotIndicator(
              pageController: controller.pageController,
              pages: controller.onboardingList,
              indicatorColor: lightGray,
              unselectedIndicatorColor: Colors.white70,
              currentBoxShape: BoxShape.rectangle,
              currentBorderRadius: radius(),
              boxShape: BoxShape.rectangle,
              borderRadius: radius(),
              currentDotSize: 26,
              currentDotWidth: 6,
              dotSize: 8,
            ),
          ),
          Positioned(
            bottom: controller.currentPageIndex.value !=
                    controller.onboardingList.length
                ? 0
                : 30,
            left: controller.currentPageIndex.value ==
                    controller.onboardingList.length
                ? 10
                : null,
            right: controller.currentPageIndex.value ==
                    controller.onboardingList.length
                ? 10
                : null,
            child: controller.currentPageIndex.value !=
                    controller.onboardingList.length
                ? Container(
                    width: UDeviceUtils.getScreenWidth(context),
                    padding: const EdgeInsets.all(20),
                    decoration: boxDecorationDefault(
                        borderRadius: radius(0),
                        color: lightPurple,
                        boxShadow:
                            defaultBoxShadow(spreadRadius: 0, blurRadius: 0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Skip', style: secondaryTextStyle(size: 16))
                            .onTap(() {
                          Get.offAndToNamed(
                            AppRoutes.login,
                          );
                        }),
                        Text('Next',
                                style: primaryTextStyle(
                                    color: textPrimaryColorGlobal))
                            .onTap(() {
                          controller.nextPage();
                        })
                      ],
                    ),
                  )
                : CommonAppButton(
                    btnText: 'Get Started',
                    onPressed: () {
                      Get.offAndToNamed(AppRoutes.login);
                    },
                  ).paddingSymmetric(horizontal: 16),
          ),
        ],
      ),
    );
  }
}
