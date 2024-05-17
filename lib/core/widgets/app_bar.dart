import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:umplay/core/constants/sizes.dart';
import 'package:umplay/core/constants/text_constants.dart';
import 'package:umplay/core/utils/device/device_utils.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.title, this.preIcon, this.postIcon});
  final String? title;
  final Widget? preIcon;
  final Widget? postIcon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UDeviceUtils.getAppBarHeight(),
      child: Stack(
        children: [
          Positioned(
            left: 1,
            child: preIcon ?? const Icon(Iconsax.backward_5_seconds3),
          ),
          Center(
            child: Text(
              title ?? UTexts.getGreetingMessage,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Positioned(
            right: 1,
            child: postIcon ??
                const Row(
                  children: [
                    Icon(Iconsax.search_normal),
                    SizedBox(
                      width: USizes.spaceBetweenItems,
                    ),
                    Icon(Iconsax.notification),
                  ],
                ),
          )
        ],
      ),
    );
  }
}
