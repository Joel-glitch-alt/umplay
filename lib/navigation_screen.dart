import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:umplay/core/constants/colors_constants.dart';
import 'package:umplay/core/constants/sizes.dart';
import 'package:umplay/core/utils/device/device_utils.dart';
import 'package:umplay/features/home/presentation/screens/home_screen.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final isDarkMode = UDeviceUtils.isDarkMode(context);

    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            height: USizes.bottomBarHeight,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            backgroundColor: isDarkMode ? UColors.black : UColors.white,
            indicatorColor: isDarkMode
                ? UColors.black.withOpacity(0.1)
                : UColors.white.withOpacity(0.1),
            onDestinationSelected: (index) =>
                {controller.selectedIndex.value = index},
            destinations: const [
              NavigationDestination(
                icon: Icon(Iconsax.home4),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.people),
                label: 'Contestants',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.safe_home),
                label: 'Collections',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.gift),
                label: 'Rewards',
              ),
            ],
          ),
        ),
        body: Obx(
          () => controller.screens[controller.selectedIndex.value],
        ));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.yellow,
    ),
  ];
}
