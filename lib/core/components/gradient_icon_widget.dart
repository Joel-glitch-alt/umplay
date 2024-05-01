import 'package:flutter/material.dart';

import '../constants/colors.dart';

class GradientIconWidget extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;

  const GradientIconWidget({super.key, this.icon, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: [primaryColor, secondaryColor.withRed(260)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [0, 0.8],
        ).createShader(bounds);
      },
      child: Icon(icon,
          size: 24, color: iconColor ?? Colors.grey),
    );
  }
}
