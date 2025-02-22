import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../constants/colors.dart';

class GradientTextWidget extends StatelessWidget {
  final String text;

  const GradientTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return GradientText(
      text,
      style: primaryTextStyle(),
      colors: [
        primaryColor.withGreen(120),
        secondaryColor.withGreen(80).withOpacity(0.7)
      ],
      gradientType: GradientType.linear,
    );
  }
}
