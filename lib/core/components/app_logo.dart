import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../constants/images.dart';

class AppLogo extends StatelessWidget {
  final double? size;

  const AppLogo({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(app_logo, height: size ?? 100, width: size ?? 100).center(),
      ],
    );
  }
}
