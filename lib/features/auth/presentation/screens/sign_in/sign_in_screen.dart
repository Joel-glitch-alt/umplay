import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umplay/core/components/app_scaffold.dart';
import 'package:umplay/core/components/common_app_button.dart';
import 'package:umplay/core/components/gradient_text_widget.dart';
import 'package:umplay/core/constants/image_constants.dart';

import 'package:umplay/core/constants/text_constants.dart';
import 'package:umplay/core/routes/app_pages.dart';
import 'package:umplay/core/utils/common.dart';
import 'package:umplay/core/utils/validators/validator.dart';
import 'package:umplay/features/auth/presentation/controllers/login_controller.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:umplay/features/auth/presentation/screens/forgot_password_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  // end region

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return AppScaffold(
      appBar: commonAppBarWidget(context, title: ''),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(UImages.appLogo, height: 80, width: 80),
                30.height,
                Text(UTexts.loginTitle,
                    style:
                        boldTextStyle(size: 24, color: textPrimaryColorGlobal)),
                25.height,
              ],
            ),
            Column(
              children: [
                AppTextField(
                  controller: controller.emailController,
                  focus: controller.emailFocus,
                  nextFocus: controller.passwordFocus,
                  textFieldType: TextFieldType.PHONE,
                  textInputAction: TextInputAction.next,
                  textStyle: primaryTextStyle(color: Colors.white),
                  decoration: inputDecoration(
                    context,
                    label: UTexts.phoneNumberLabel,
                    prefixIcon: const Icon(Icons.phone).paddingAll(13),
                  ),
                  validator: (value) => FormValidator.validatePhone(value),
                ),
                22.height,
                AppTextField(
                  controller: controller.passwordController,
                  focus: controller.passwordFocus,
                  textFieldType: TextFieldType.PASSWORD,
                  textInputAction: TextInputAction.done,
                  suffixPasswordVisibleWidget:
                      const Icon(Icons.show_chart).paddingAll(13),
                  suffixPasswordInvisibleWidget:
                      const Icon(Icons.phone).paddingAll(13),
                  textStyle: primaryTextStyle(color: Colors.white),
                  decoration: inputDecoration(context,
                      label: UTexts.passwordLabel,
                      prefixIcon: const Icon(Icons.lock)),
                  validator: (value) => FormValidator.validatePassword(value),
                ),
                16.height,
              ],
            ),
            Column(
              children: [
                CommonAppButton(
                  btnText: UTexts.loginButton,
                  onPressed: () {
                    hideKeyboard(context);
                    // Get.dialog(
                    //   AlertDialog(
                    //     title: const Text('Dialog'),
                    //     content: const Text('This is a dialog'),
                    //     actions: [
                    //       TextButton(
                    //         child: const Text("Close"),
                    //         onPressed: () => Get.back(),
                    //       ),
                    //     ],
                    //   ),
                    // );
                    Get.snackbar('login pressed', 'login in');
                  },
                ),
                20.height,
                TextButton(
                  onPressed: () {
                    hideKeyboard(context);
                    Get.toNamed(AppPages.forgotPassword);
                  },
                  child: const GradientTextWidget(text: UTexts.forgotPassword),
                ),
                24.height,
              ],
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(UTexts.createAccount,
                    style: primaryTextStyle(color: textPrimaryColorGlobal)),
                TextButton(
                  onPressed: () {
                    hideKeyboard(context);
                    Get.toNamed(AppPages.register);
                  },
                  child: const GradientTextWidget(text: UTexts.registerButton),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
