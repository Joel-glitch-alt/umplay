import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class IconBackgroundWidget extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? height;
  final double? boxHeight;
  final double? width;
  final double? boxWidth;
  final double? padding;
  final Color? iconColor;
  final Gradient? gradient;

  const IconBackgroundWidget({super.key, required this.icon, this.color, this.height, this.width, this.padding, this.iconColor, this.boxHeight, this.boxWidth, this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? 14),
      height: boxHeight,
      width: boxWidth,
      decoration: boxDecorationDefault(
        color: color ?? Colors.grey.withAlpha(22),
        gradient: gradient,
        boxShadow: defaultBoxShadow(blurRadius: 0, shadowColor: Colors.black.withAlpha(20)),
      ),
      child: Image.asset(icon.validate(), height: height ?? 22, width: width ?? 22, color: iconColor),
    );
  }
}
