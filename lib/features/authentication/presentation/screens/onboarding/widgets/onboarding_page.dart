import 'package:flutter/material.dart';
import 'package:umplay/core/constants/sizes.dart';

import 'package:umplay/core/utils/device/device_utils.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image(
            image: AssetImage(image),
            width: UDeviceUtils.getScreenHeight(context) * .65,
            height: UDeviceUtils.getScreenWidth(context) * 0.65,
          ),
          SizedBox(
            height: (UDeviceUtils.getScreenHeight(context) >= 840) ? 60 : 30,
          ),
          Text(title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center),
          const SizedBox(
            height: USizes.spaceBetweenItems,
          ),
          Text(description,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
