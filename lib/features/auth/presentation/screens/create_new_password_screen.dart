import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:umplay/core/utils/string_extensions.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/components/app_scaffold.dart';
import '../../../../core/components/blur_dialog_widget.dart';
import '../../../../core/components/common_app_button.dart';
import '../../../../core/components/icon_background_widget.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/common.dart';
import '../../../../core/constants/images.dart';
import '../../../screens/dashboard/dashboard_screen.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  _CreateNewPasswordScreenState createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  TextEditingController passwordCont = TextEditingController();
  TextEditingController confirmPasswordCont = TextEditingController();

  FocusNode passwordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();

  bool isRemember = true;

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
      resizeToAvoidBottomInset: true,
      appBar: commonAppBarWidget(context, title: 'Create New Password'),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 50),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Create Your New Password',
                      style: primaryTextStyle(color: textPrimaryColorGlobal)),
                ),
                22.height,
                AppTextField(
                  controller: passwordCont,
                  focus: passwordFocus,
                  textFieldType: TextFieldType.PASSWORD,
                  textInputAction: TextInputAction.done,
                  suffixPasswordVisibleWidget: ic_show
                      .iconImage(size: 10, color: Colors.grey)
                      .paddingAll(14),
                  suffixPasswordInvisibleWidget: ic_hide
                      .iconImage(size: 10, color: Colors.grey)
                      .paddingAll(14),
                  textStyle: primaryTextStyle(color: Colors.white),
                  decoration: inputDecoration(
                    context,
                    label: 'Password',
                    prefixIcon: ic_lock
                        .iconImage(size: 10, color: Colors.white)
                        .paddingAll(13),
                  ),
                ),
                22.height,
                AppTextField(
                  controller: confirmPasswordCont,
                  focus: confirmPasswordFocus,
                  textFieldType: TextFieldType.PASSWORD,
                  textInputAction: TextInputAction.done,
                  suffixPasswordVisibleWidget: ic_show
                      .iconImage(size: 10, color: Colors.grey)
                      .paddingAll(14),
                  suffixPasswordInvisibleWidget: ic_hide
                      .iconImage(size: 10, color: Colors.grey)
                      .paddingAll(14),
                  textStyle: primaryTextStyle(color: Colors.white),
                  decoration: inputDecoration(
                    context,
                    label: 'Confirm Password',
                    prefixIcon: ic_lock
                        .iconImage(size: 10, color: Colors.white)
                        .paddingAll(13),
                  ),
                ),
                10.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 16,
                      width: 16,
                      child: Checkbox(
                        activeColor: Colors.grey.withAlpha(40),
                        checkColor: Colors.grey,
                        value: isRemember,
                        visualDensity: VisualDensity.compact,
                        shape: RoundedRectangleBorder(borderRadius: radius(4)),
                        onChanged: (value) {
                          isRemember = value.validate();
                          setState(() {});
                        },
                      ),
                    ),
                    6.width,
                    TextButton(
                      onPressed: () {
                        isRemember = !isRemember;
                        setState(() {});
                      },
                      child: Text('Remember me',
                          style:
                              primaryTextStyle(color: textPrimaryColorGlobal)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: CommonAppButton(
              btnText: 'Continue',
              onPressed: () async {
                hideKeyboard(context);
                showDialog(
                  context: context,
                  builder: (context) {
                    return BlurDialogWidget(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const IconBackgroundWidget(icon: ic_shield),
                          20.height,
                          Text('Congr atulations!',
                              style:
                                  boldTextStyle(color: textPrimaryColorGlobal)),
                          10.height,
                          Text(
                              'Your account is ready to use. You will be redirected to the home page in a few seconds.',
                              style: secondaryTextStyle(),
                              textAlign: TextAlign.center),
                          30.height,
                          const SpinKitCircle(
                              color: loaderColor,
                              duration: Duration(seconds: 2)),
                        ],
                      ),
                    );
                  },
                );
                await 1.seconds.delay;
                finish(context);
                const DashBoardScreen().launch(context,
                    pageRouteAnimation: PageRouteAnimation.Slide);
              },
            ),
          )
        ],
      ),
    );
  }
}
