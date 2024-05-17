import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:umplay/config/theme/common.dart';
import 'package:umplay/core/constants/sizes.dart';
import 'package:umplay/core/constants/text_constants.dart';
import 'package:umplay/core/utils/device/device_utils.dart';
import 'package:umplay/core/utils/validators/validator.dart';
import 'package:umplay/core/widgets/app_scaffold.dart';

import 'package:umplay/core/widgets/buttonwidget.dart';
import 'package:umplay/features/authentication/presentation/controllers/login/login_controller.dart';
import 'package:umplay/features/authentication/presentation/screens/signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final bool checkedValue = false;
  final bool register = true;
  final List textfieldsStrings = [
    "", //firstName
    "", //lastName
    "", //email
    "", //password
    "", //confirmPassword
  ];

  final _firstnamekey = GlobalKey<FormState>();
  final _lastNamekey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final _confirmPasswordKey = GlobalKey<FormState>();

  bool pwVisible = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = UDeviceUtils.isDarkMode(context);
    final controller = Get.put(LoginController());
    bool register = false;
    Size size = MediaQuery.of(context).size;

    return AppScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: UDeviceUtils.getScreenWidth(context) * 0.015),
              child: Align(
                child: Text(
                  UTexts.loginSubtitle,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color:
                            isDarkMode ? Colors.white : const Color(0xff1D1617),
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: UDeviceUtils.getScreenWidth(context) * 0.01),
            ),

            //form
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.025),
              child: Form(
                key: controller.loginFormKkey,
                child: Column(
                  children: [
                    AppTextField(
                      controller: controller.phone,
                      textFieldType: TextFieldType.PHONE,
                      textInputAction: TextInputAction.next,
                      textStyle: primaryTextStyle(color: Colors.white),
                      validator: (value) => FormValidator.validatePhone(
                        value,
                      ),
                      decoration: inputDecoration(context,
                          label: 'Phone Number',
                          prefixIcon: const Icon(Iconsax.call).paddingAll(13)),
                    ),
                    const SizedBox(
                      height: USizes.spaceBetweenInputFields,
                    ),
                    AppTextField(
                      controller: controller.password,
                      textFieldType: TextFieldType.PASSWORD,
                      textInputAction: TextInputAction.done,
                      suffixPasswordVisibleWidget:
                          const Icon(Iconsax.eye_slash).paddingAll(14),
                      suffixPasswordInvisibleWidget:
                          const Icon(Iconsax.eye).paddingAll(14),
                      textStyle: primaryTextStyle(color: Colors.white),
                      decoration: inputDecoration(
                        context,
                        label: 'Password',
                        prefixIcon: const Icon(Iconsax.lock).paddingAll(13),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        UTexts.forgotPassword,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: const Color(0xffADA4A5),
                          decoration: TextDecoration.underline,
                          fontSize: UDeviceUtils.getScreenWidth(context) * 0.03,
                        ),
                      ),
                    ),
                    AnimatedPadding(
                      duration: const Duration(milliseconds: 500),
                      padding: EdgeInsets.only(
                          top: UDeviceUtils.getScreenWidth(context) * 0.085),
                      child: ButtonWidget(
                        text: "Login",
                        backColor: isDarkMode
                            ? [
                                Colors.black,
                                Colors.black,
                              ]
                            : const [Color(0xff92A3FD), Color(0xff9DCEFF)],
                        textColor: const [
                          Colors.white,
                          Colors.white,
                        ],
                        onPressed: () async {
                          controller.login();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don’t have an account?',
                    style: primaryTextStyle(color: textPrimaryColorGlobal)),
                TextButton(
                  onPressed: () {
                    hideKeyboard(context);
                    Get.to(() => const SignupScreen());
                  },
                  child: const Text('Sign up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
    String error, context, size) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.black,
      content: SizedBox(
        height: UDeviceUtils.getScreenWidth(context) * 0.02,
        child: Center(
          child: Text(error),
        ),
      ),
    ),
  );
}
