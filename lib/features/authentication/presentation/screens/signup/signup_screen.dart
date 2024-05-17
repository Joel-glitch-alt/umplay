import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:umplay/config/theme/common.dart';
import 'package:umplay/config/theme/common_app_button.dart';
import 'package:umplay/core/constants/colors_constants.dart';
import 'package:umplay/core/constants/image_constants.dart';
import 'package:umplay/core/constants/sizes.dart';
import 'package:umplay/core/constants/text_constants.dart';
import 'package:umplay/core/widgets/app_scaffold.dart';
import 'package:umplay/core/widgets/buttonwidget.dart';
import 'package:umplay/features/authentication/presentation/controllers/sign_up/sign_up_controller.dart';
import 'package:umplay/core/utils/device/device_utils.dart';
import 'package:umplay/core/utils/validators/validator.dart';
import 'package:umplay/features/authentication/presentation/screens/login/login.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final isDarkMode = UDeviceUtils.isDarkMode(context);

    List<String> regions = ["Handball", "Volleyball", "Football", "Badminton"];
    var selectedValue = regions[0];

    return AppScaffold(
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
                Text(
                  UTexts.registrationTitle,
                  style: boldTextStyle(size: 24, color: textPrimaryColorGlobal),
                ),
                Text(
                  UTexts.registrationTitle,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color:
                            isDarkMode ? Colors.white : const Color(0xff1D1617),
                      ),
                ),
                25.height,
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: USizes.appbarHeight * 0.025),
              child: Form(
                key: controller.signupFormKkey,
                child: Column(
                  children: [
                    AppTextField(
                      controller: controller.firstName,
                      textFieldType: TextFieldType.NAME,
                      textInputAction: TextInputAction.next,
                      textStyle: primaryTextStyle(color: Colors.white),
                      decoration: inputDecoration(context,
                          label: 'First Name',
                          prefixIcon: const Icon(Iconsax.user).paddingAll(13)),
                    ),
                    22.height,
                    AppTextField(
                      controller: controller.lastName,
                      textFieldType: TextFieldType.NAME,
                      textInputAction: TextInputAction.next,
                      textStyle: primaryTextStyle(color: Colors.white),
                      decoration: inputDecoration(context,
                          label: 'Last Name',
                          prefixIcon: const Icon(Iconsax.user).paddingAll(13)),
                    ),
                    22.height,
                    AppTextField(
                      controller: controller.userName,
                      textFieldType: TextFieldType.NAME,
                      textInputAction: TextInputAction.next,
                      textStyle: primaryTextStyle(color: Colors.white),
                      decoration: inputDecoration(context,
                          label: 'Username',
                          prefixIcon: const Icon(Iconsax.user).paddingAll(13)),
                    ),
                    22.height,
                    DropdownButtonFormField<String>(
                      value: null,
                      borderRadius: const BorderRadius.all(
                          Radius.circular(USizes.defaultRadius)),
                      // dropdownColor: appStore.appBarColor,
                      hint: Text(
                        'Choose Region',
                        style: primaryTextStyle(size: 16),
                      ).paddingLeft(8),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        // color: appStore.iconColor,
                      ).paddingLeft(10),
                      onChanged: (String? newValue) {
                        controller.region.text = newValue!;
                      },
                      items: <String>[
                        '',
                        'Normal',
                        'Bold',
                        'Italic',
                        'Underline'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Tooltip(
                              message: value,
                              child: Container(
                                  margin: EdgeInsets.only(left: 4, right: 4),
                                  child:
                                      Text(value, style: primaryTextStyle()))),
                        );
                      }).toList(),
                    ),
                    22.height,
                    AppTextField(
                      controller: controller.email,
                      textFieldType: TextFieldType.EMAIL,
                      textInputAction: TextInputAction.next,
                      textStyle: primaryTextStyle(color: Colors.white),
                      decoration: inputDecoration(context,
                          label: 'Email',
                          prefixIcon:
                              const Icon(Iconsax.message).paddingAll(13)),
                    ),
                    22.height,
                    AppTextField(
                      controller: controller.phone,
                      textFieldType: TextFieldType.PHONE,
                      validator: (value) => FormValidator.validatePhone(
                        value,
                      ),
                      textInputAction: TextInputAction.next,
                      textStyle: primaryTextStyle(color: Colors.white),
                      decoration: inputDecoration(context,
                          label: 'Phone Number',
                          prefixIcon:
                              const Icon(Iconsax.message).paddingAll(13)),
                    ),
                    22.height,
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
                    16.height,
                  ],
                ),
              ),
            ),
            Column(
              children: [
                20.height,
                CommonAppButton(
                  btnText: 'Sign up',
                  onPressed: () {
                    controller.signup();
                  },
                ),
                24.height,
                Text('or continue with'),
                16.height,
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?',
                    style: primaryTextStyle(color: textPrimaryColorGlobal)),
                TextButton(
                  onPressed: () {
                    hideKeyboard(context);
                    Get.to(() => LoginScreen());
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(),
    //   body: SingleChildScrollView(
    //     child: Padding(
    //       padding: const EdgeInsets.all(USizes.defaultSpace),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             UTexts.registrationTitle,
    //             style: Theme.of(context).textTheme.headlineLarge,
    //             textAlign: TextAlign.center,
    //           ),
    //           const SizedBox(
    //             height: USizes.spaceBetweenSections,
    //           ),

    //           //Form
    //           Form(
    //             key: controller.signupFormKkey,
    //             child: Column(
    //               children: [
    //                 Row(
    //                   children: [
    //                     Expanded(
    //                       child: TextFormField(
    //                         controller: controller.firstName,
    //                         validator: (value) =>
    //                             FormValidator.validateEmptyText(
    //                                 value, UTexts.firstNameLabel),
    //                         expands: false,
    //                         decoration: const InputDecoration(
    //                             labelText: UTexts.firstNameLabel,
    //                             prefixIcon: Icon(Iconsax.user)),
    //                       ),
    //                     ),
    //                     const SizedBox(
    //                       width: USizes.spaceBetweenInputFields,
    //                     ),
    //                     Expanded(
    //                       child: TextFormField(
    //                         controller: controller.lastName,
    //                         validator: (value) =>
    //                             FormValidator.validateEmptyText(
    //                                 value, UTexts.lastNameLabel),
    //                         expands: false,
    //                         decoration: const InputDecoration(
    //                           labelText: UTexts.lastNameLabel,
    //                           prefixIcon: Icon(
    //                             Iconsax.user,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 const SizedBox(
    //                   height: USizes.spaceBetweenInputFields,
    //                 ),
    //                 Row(
    //                   children: [
    //                     Expanded(
    //                       child: TextFormField(
    //                         controller: controller.userName,
    //                         validator: (value) =>
    //                             FormValidator.validateEmptyText(
    //                                 value, UTexts.usernameLabel),
    //                         expands: false,
    //                         decoration: const InputDecoration(
    //                             labelText: UTexts.usernameLabel,
    //                             prefixIcon: Icon(Iconsax.user_edit)),
    //                       ),
    //                     ),
    //                     const SizedBox(
    //                       width: USizes.spaceBetweenInputFields,
    //                     ),
    //                     Expanded(
    //                       child: TextFormField(
    //                         controller: controller.email,
    //                         validator: (value) =>
    //                             FormValidator.validateEmail(value),
    //                         expands: false,
    //                         decoration: const InputDecoration(
    //                           labelText: UTexts.emailAddressLabel,
    //                           prefixIcon: Icon(
    //                             Iconsax.direct,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 const SizedBox(
    //                   height: USizes.spaceBetweenInputFields,
    //                 ),
    //                 TextFormField(
    //                   controller: controller.phone,
    //                   validator: (value) => FormValidator.validatePhone(
    //                     value,
    //                   ),
    //                   decoration: const InputDecoration(
    //                     labelText: UTexts.phoneNumberLabel,
    //                     prefixIcon: Icon(
    //                       Iconsax.call,
    //                     ),
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   height: USizes.spaceBetweenInputFields,
    //                 ),
    //                 Obx(
    //                   () => TextFormField(
    //                     controller: controller.password,
    //                     validator: (value) =>
    //                         FormValidator.validatePassword(value),
    //                     obscureText: controller.hidePassword.value,
    //                     decoration: InputDecoration(
    //                       labelText: UTexts.passwordLabel,
    //                       prefixIcon: const Icon(
    //                         Iconsax.call,
    //                       ),
    //                       suffixIcon: IconButton(
    //                           onPressed: () => controller.hidePassword.value,
    //                           icon: Icon(controller.hidePassword.value
    //                               ? Iconsax.eye_slash
    //                               : Iconsax.eye)),
    //                     ),
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   height: USizes.spaceBetweenInputFields,
    //                 ),
    //                 DropdownButtonFormField(
    //                   decoration: InputDecoration(
    //                     errorBorder: OutlineInputBorder(
    //                         borderSide:
    //                             const BorderSide(width: 1, color: Colors.red),
    //                         borderRadius: BorderRadius.circular(10)),
    //                   ),
    //                   onChanged: (value) => {},
    //                   value: selectedValue,
    //                   items:
    //                       regions.map<DropdownMenuItem<String>>((String value) {
    //                     return DropdownMenuItem<String>(
    //                       value: value,
    //                       child: Text(value),
    //                     );
    //                   }).toList(),
    //                 ),
    //                 const SizedBox(
    //                   height: USizes.spaceBetweenInputFields,
    //                 ),
    //                 TextFormField(
    //                   controller: controller.address,
    //                   validator: (value) => FormValidator.validateEmptyText(
    //                       value, UTexts.addressLabel),
    //                   maxLength: 100,
    //                   maxLines: 2,
    //                   decoration: const InputDecoration(
    //                     labelText: UTexts.addressLabel,
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   height: USizes.spaceBetweenInputFields,
    //                 ),
    //                 TextFormField(
    //                   maxLength: 100,
    //                   maxLines: 2,
    //                   decoration: const InputDecoration(
    //                     labelText: UTexts.addressLabel,
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   height: USizes.spaceBetweenInputFields,
    //                 ),
    //                 TextFormField(
    //                   maxLength: 100,
    //                   maxLines: 2,
    //                   decoration: const InputDecoration(
    //                     labelText: UTexts.addressLabel,
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   height: USizes.spaceBetweenInputFields,
    //                 ),
    //                 Row(
    //                   children: [
    //                     SizedBox(
    //                       width: 24,
    //                       height: 24,
    //                       child: Checkbox(
    //                         value: true,
    //                         onChanged: (value) => {},
    //                       ),
    //                     ),
    //                     const SizedBox(
    //                       height: USizes.spaceBetweenInputFields,
    //                     ),
    //                     Text.rich(
    //                       TextSpan(
    //                         children: [
    //                           TextSpan(
    //                             text: '${UTexts.iagreeTo} ',
    //                             style: Theme.of(context).textTheme.bodySmall,
    //                           ),
    //                           TextSpan(
    //                             text: UTexts.privacyPolicy,
    //                             style: Theme.of(context)
    //                                 .textTheme
    //                                 .bodyMedium
    //                                 ?.apply(
    //                                   color: isDarkMode
    //                                       ? UColors.white
    //                                       : UColors.black,
    //                                   decoration: TextDecoration.underline,
    //                                   decorationColor: isDarkMode
    //                                       ? UColors.white
    //                                       : UColors.black,
    //                                 ),
    //                           ),
    //                           TextSpan(
    //                             text: ' and ',
    //                             style: Theme.of(context).textTheme.bodySmall,
    //                           ),
    //                           TextSpan(
    //                             text: UTexts.termsAndConditions,
    //                             style: Theme.of(context)
    //                                 .textTheme
    //                                 .bodyMedium
    //                                 ?.apply(
    //                                   color: isDarkMode
    //                                       ? UColors.white
    //                                       : UColors.black,
    //                                   decoration: TextDecoration.underline,
    //                                   decorationColor: isDarkMode
    //                                       ? UColors.white
    //                                       : UColors.black,
    //                                 ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 const SizedBox(
    //                   height: USizes.spaceBetweenInputFields,
    //                 ),
    //                 SizedBox(
    //                   width: double.infinity,
    //                   child: ElevatedButton(
    //                     onPressed: () {
    //                       controller.signup();
    //                     },
    //                     child: const Text(UTexts.createAccount),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
