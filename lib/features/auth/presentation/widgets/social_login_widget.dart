import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:umplay/core/constants/images.dart';
import 'package:umplay/core/utils/string_extensions.dart';

Widget _buildSocialWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
        icon: ic_facebook.iconImage(size: 24, color: Colors.white),
        onPressed: () {
          //
        },
      ),
      16.width,
      IconButton(
        icon: ic_google.iconImage(size: 24, color: Colors.white),
        onPressed: () {
          //
        },
      ),
      16.width,
      IconButton(
        icon: ic_apple.iconImage(size: 24, color: Colors.white),
        onPressed: () {
          //
        },
      ),
    ],
  );
}
