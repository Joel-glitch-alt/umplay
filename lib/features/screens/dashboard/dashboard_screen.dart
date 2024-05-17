import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:umplay/core/constants/colors_constants.dart';
import 'package:umplay/core/constants/sizes.dart';
import 'package:umplay/core/utils/device/device_utils.dart';
import 'package:umplay/features/contestants/presentation/screens/contestants_fragment.dart';

import '../../../core/components/app_scaffold.dart';
import '../../../core/components/icon_background_widget.dart';
import '../../../core/utils/common.dart';
import '../../../core/constants/images.dart';
import '../../home/presentation/screens/home_fragment.dart';
import 'fragment/library_fragment.dart';
import 'fragment/music_fragment.dart';
import 'fragment/setting_fragment.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

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
                ? UColors.white.withOpacity(0.1)
                : UColors.black.withOpacity(0.1),
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
    const HomeFragment(),
    const ContestantsFragment(),
    const MusicFragment(),
    const LibraryFragment(),
    const SettingFragment(),
  ];
}
