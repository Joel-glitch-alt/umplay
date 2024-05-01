import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:umplay/core/constants/sizes.dart';

import '../constants/colors.dart';
import '../constants/constant.dart';

class BlurDialogWidget extends StatelessWidget {
  final Widget child;

  const BlurDialogWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: ClipRRect(
          borderRadius: radius(USizes.defaultRadius),
          child: Container(
            color: dialogBackColor.withOpacity(0.6),
            padding: const EdgeInsets.all(16),
            child: child,
          ),
        ),
      ),
    );
  }
}
