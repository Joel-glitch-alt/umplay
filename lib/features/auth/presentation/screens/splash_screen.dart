import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:umplay/core/components/app_scaffold.dart';
import 'package:umplay/core/constants/colors.dart';
import 'package:umplay/core/constants/constant.dart';
import 'package:umplay/core/constants/images.dart';
import 'package:umplay/core/utils/device/device_utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Stack(
        children: [
          Image.asset(app_logo,
                  height: UDeviceUtils.getScreenHeight(context) * 0.5,
                  width: UDeviceUtils.getScreenWidth(context) * 0.5)
              .center(),
          const Positioned(
            bottom: 200,
            left: 0,
            right: 0,
            child: SpinKitCircle(
              color: loaderColor,
              duration: Duration(seconds: 2),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Text(APP_NAME,
                    style:
                        boldTextStyle(size: 30, color: textPrimaryColorGlobal))
                .center(),
          ),
        ],
      ),
    );
  }
}
