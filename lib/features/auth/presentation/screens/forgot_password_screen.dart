import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/components/app_scaffold.dart';
import '../../../../core/components/common_app_button.dart';
import '../../../../core/components/icon_background_widget.dart';
import '../../../../core/components/transparent_container_widget.dart';
import '../../../../core/utils/common.dart';
import '../../../../core/constants/images.dart';
import 'create_new_password_screen.dart';
import 'otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool onSmsTap = false;
  bool onEmailTap = false;

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

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: commonAppBarWidget(context, title: 'Forgot password'),
      body: Stack(
        children: [
          Container(
            height: context.height(),
            width: context.width(),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                      'Select which contact details should we use to reset your password',
                      style: primaryTextStyle(color: textPrimaryColorGlobal)),
                  30.height,
                  TransparentContainerWidget(
                    context,
                    borderRadius: 42,
                    onPressed: () {
                      onSmsTap = true;
                      if (onEmailTap) {
                        onEmailTap = false;
                      }
                      setState(() {});
                    },
                    innerChild: SettingItemWidget(
                      title: 'via SMS:',
                      titleTextStyle: primaryTextStyle(color: Colors.white),
                      subTitle: '(406) *****20',
                      padding: const EdgeInsets.all(4),
                      trailing: onSmsTap
                          ? Image.asset(ic_check,
                              height: 14, width: 14, color: greenColor)
                          : null,
                      leading: const IconBackgroundWidget(icon: ic_chat),
                    ),
                  ),
                  22.height,
                  TransparentContainerWidget(
                    context,
                    borderRadius: 42,
                    onPressed: () {
                      onEmailTap = true;
                      if (onSmsTap) {
                        onSmsTap = false;
                      }
                      setState(() {});
                    },
                    innerChild: SettingItemWidget(
                      title: 'via Email:',
                      titleTextStyle: primaryTextStyle(color: Colors.white),
                      subTitle: 'es*******rd@example.com',
                      padding: const EdgeInsets.all(4),
                      trailing: onEmailTap
                          ? Image.asset(ic_check,
                              height: 14, width: 14, color: greenColor)
                          : null,
                      leading: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: boxDecorationDefault(
                          color: Colors.grey.withAlpha(22),
                          boxShadow: defaultBoxShadow(
                              blurRadius: 0,
                              shadowColor: Colors.black.withAlpha(20)),
                        ),
                        child: Image.asset(ic_mail2, height: 22, width: 22),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: CommonAppButton(
              btnText: 'Continue',
              onPressed: () {
                if (onEmailTap) {
                  const CreateNewPasswordScreen().launch(context,
                      pageRouteAnimation: PageRouteAnimation.Slide);
                }
                if (onSmsTap) {
                  const OTPScreen().launch(context,
                      pageRouteAnimation: PageRouteAnimation.Slide);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
