import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umplay/core/constants/image_constants.dart';
import 'package:umplay/core/constants/sizes.dart';
import 'package:umplay/core/constants/text_constants.dart';
import 'package:umplay/core/utils/device/device_utils.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [
              Image(
                  image: const AssetImage(UImages.appLogo),
                  width: UDeviceUtils.getScreenWidth(context) * 0.6),
              const SizedBox(
                height: USizes.spaceBetweenSections,
              ),

              //Title and SubTitle
              Text(
                UTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: USizes.spaceBetweenItems,
              ),
              Text(
                UTexts.confirmPasswordLabel,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: USizes.spaceBetweenSections,
              ),

              //
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {}, child: const Text('Done')),
              ),
              const SizedBox(
                height: USizes.spaceBetweenSections,
              ),
              //
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Resend OPTP')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
