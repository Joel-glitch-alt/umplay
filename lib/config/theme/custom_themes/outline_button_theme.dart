import 'package:flutter/material.dart';

class UOutlineButtonTheme {
  UOutlineButtonTheme._();

  static final lightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const StadiumBorder(),
      side: const BorderSide(color: Colors.blue, width: 1),
      minimumSize: const Size(double.infinity, 50),
      maximumSize: const Size(double.infinity, 50),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.blue,
        fontWeight: FontWeight.w600,
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  );

  static final darkOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const StadiumBorder(),
      side: const BorderSide(color: Colors.blue, width: 1),
      minimumSize: const Size(double.infinity, 50),
      maximumSize: const Size(double.infinity, 50),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  );
}
