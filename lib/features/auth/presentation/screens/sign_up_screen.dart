import 'package:flutter/material.dart';
import 'package:umplay/core/utils/string_extensions.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/components/app_scaffold.dart';
import '../../../../core/components/common_app_button.dart';
import '../../../../core/components/gradient_text_widget.dart';
import '../../../../core/utils/common.dart';
import '../../../../core/constants/images.dart';
import '../../../screens/account_setup/profile_screen.dart';
import 'sign_in/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  // region widget
  Widget _buildTopWidget() {
    return Column(
      children: [
        Image.asset(app_logo, height: 80, width: 80),
        30.height,
        Text('Create Your Account',
            style: boldTextStyle(size: 24, color: textPrimaryColorGlobal)),
        25.height,
      ],
    );
  }

  Widget _buildFormWidget() {
    return Column(
      children: [
        AppTextField(
          controller: nameCont,
          focus: nameFocus,
          nextFocus: emailFocus,
          textFieldType: TextFieldType.NAME,
          textInputAction: TextInputAction.next,
          textStyle: primaryTextStyle(color: Colors.white),
          decoration: inputDecoration(context,
              label: 'Name',
              prefixIcon: ic_mail
                  .iconImage(size: 10, color: Colors.white)
                  .paddingAll(13)),
        ),
        22.height,
        AppTextField(
          controller: emailCont,
          focus: emailFocus,
          nextFocus: passwordFocus,
          textFieldType: TextFieldType.EMAIL,
          textInputAction: TextInputAction.next,
          textStyle: primaryTextStyle(color: Colors.white),
          decoration: inputDecoration(context,
              label: 'Email',
              prefixIcon: ic_mail
                  .iconImage(size: 10, color: Colors.white)
                  .paddingAll(13)),
        ),
        22.height,
        AppTextField(
          controller: passwordCont,
          focus: passwordFocus,
          textFieldType: TextFieldType.PASSWORD,
          textInputAction: TextInputAction.done,
          suffixPasswordVisibleWidget:
              ic_show.iconImage(size: 10, color: Colors.grey).paddingAll(14),
          suffixPasswordInvisibleWidget:
              ic_hide.iconImage(size: 10, color: Colors.grey).paddingAll(14),
          textStyle: primaryTextStyle(color: Colors.white),
          decoration: inputDecoration(
            context,
            label: 'Password',
            prefixIcon:
                ic_lock.iconImage(size: 10, color: Colors.white).paddingAll(13),
          ),
        ),
        16.height,
      ],
    );
  }

  Widget _buildRememberWidget() {
    return Column(
      children: [
        20.height,
        CommonAppButton(
          btnText: 'Sign up',
          onPressed: () {
            hideKeyboard(context);
            const ProfileScreen()
                .launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
          },
        ),
        24.height,
      ],
    );
  }

  Widget _buildSocialWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: ic_facebook.iconImage(size: 24, color: Colors.white),
          onPressed: () {
            //
          },
        ),
        16.width,
        IconButton(
          icon: ic_google.iconImage(size: 24, color: Colors.white),
          onPressed: () {
            //
          },
        ),
        16.width,
        IconButton(
          icon: ic_apple.iconImage(size: 24, color: Colors.white),
          onPressed: () {
            //
          },
        ),
      ],
    );
  }
  // end region

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: commonAppBarWidget(context, title: ''),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTopWidget(),
            _buildFormWidget(),
            _buildRememberWidget(),
            10.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?',
                    style: primaryTextStyle(color: textPrimaryColorGlobal)),
                TextButton(
                  onPressed: () {
                    hideKeyboard(context);
                    const SignInScreen().launch(context,
                        pageRouteAnimation: PageRouteAnimation.Slide);
                  },
                  child: const GradientTextWidget(text: 'Log In'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
