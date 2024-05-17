import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:umplay/core/constants/sizes.dart';
import 'package:umplay/core/constants/text_constants.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              UTexts.forgotPassword,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: USizes.spaceBetweenItems),
            Text(
              UTexts.forgotPassword,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: USizes.spaceBetweenSections * 2),

            /// Text Field..
            TextFormField(
              decoration: const InputDecoration(
                  labelText: UTexts.emailAddressLabel,
                  prefixIcon: Icon(Iconsax.direct_right)),
            ),

            const SizedBox(
              height: USizes.spaceBetweenSections,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {}, child: const Text("Submit")))
          ],
        ),
      ),
    );
  }
}
