import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:umplay/core/constants/sizes.dart';
import 'package:umplay/core/utils/common.dart';

class CommonAppButton extends StatelessWidget {
  final String? btnText;
  final double? width;
  final double? height;
  final Gradient? gradient;
  final VoidCallback? onPressed;
  final Color? textColor;

  const CommonAppButton(
      {super.key,
      required this.onPressed,
      required this.btnText,
      this.width,
      this.height,
      this.gradient,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.width(),
      height: height ?? 55.0,
      decoration: boxDecorationDefault(
        gradient: gradient ?? primaryHomeLinearGradient(),
        borderRadius: radius(USizes.defaultRadius),
        boxShadow: [
          const BoxShadow(spreadRadius: 0, color: Colors.transparent)
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black.withOpacity(0.68),
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: radius(USizes.defaultRadius)),
        ),
        child: Text(btnText.validate(),
            style:
                primaryTextStyle(color: textColor ?? textPrimaryColorGlobal)),
      ),
    );
  }
}
