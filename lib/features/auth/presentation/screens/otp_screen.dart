import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/components/app_scaffold.dart';
import '../../../../core/components/blur_dialog_widget.dart';
import '../../../../core/components/common_app_button.dart';
import '../../../../core/components/gradient_text_widget.dart';
import '../../../../core/components/icon_background_widget.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/common.dart';
import '../../../../core/constants/images.dart';
import '../../../screens/dashboard/dashboard_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final interval = const Duration(seconds: 1);

  int timerMaxSeconds = 40;
  int currentSeconds = 0;
  String otpCode = '';

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    startTimeout();
  }

  void startTimeout([int? milliseconds]) {
    var duration = interval;
    _timer = Timer.periodic(duration, (timer) {
      setState(() {
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) {
          timer.cancel();
        }
      });
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      resizeToAvoidBottomInset: true,
      appBar: commonAppBarWidget(context, title: 'OTP Verification'),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 50),
            child: Column(
              children: [
                Text('Code has been send to (406) *****20',
                    style: primaryTextStyle(color: textPrimaryColorGlobal)),
                30.height,
                OTPTextField(
                  pinLength: 4,
                  fieldWidth: 70,
                  // textStyle: primaryTextStyle(color: Colors.white),
                  onChanged: (s) {
                    otpCode = s;
                    log(otpCode);
                  },
                  onCompleted: (pin) {
                    otpCode = pin;
                  },
                ).fit(),
                30.height,
                Text(
                  'Resend code in ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}s',
                  style: primaryTextStyle(color: textPrimaryColorGlobal),
                ).visible(!(currentSeconds == timerMaxSeconds)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Didn’t get the OTP?',
                        style:
                            secondaryTextStyle(color: textPrimaryColorGlobal)),
                    TextButton(
                      onPressed: () {
                        startTimeout();
                      },
                      child: const GradientTextWidget(text: 'Resend OTP'),
                    ),
                  ],
                ).visible(currentSeconds == timerMaxSeconds),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: CommonAppButton(
              btnText: 'Verify',
              onPressed: () async {
                FocusScope.of(context).unfocus();
                hideKeyboard(context);
                _timer.cancel();
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
                finish(context);
                const DashBoardScreen().launch(context,
                    pageRouteAnimation: PageRouteAnimation.Slide);
              },
            ),
          ),
        ],
      ),
    );
  }
}
