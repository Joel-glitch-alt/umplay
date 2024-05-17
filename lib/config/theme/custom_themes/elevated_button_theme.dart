import 'package:flutter/material.dart';

class UElevatedButtonTheme {
  UElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const StadiumBorder(
            side: BorderSide(color: Colors.blue, width: 1),
          ),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          shadowColor: Colors.white,
          disabledForegroundColor: Colors.grey,
          disabledBackgroundColor: Colors.grey,
          minimumSize: const Size(double.infinity, 50),
          maximumSize: const Size(double.infinity, 50),
          side: const BorderSide(color: Colors.blue, width: 1),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
          textStyle: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap));
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const StadiumBorder(
            side: BorderSide(color: Colors.blue, width: 1),
          ),
          foregroundColor: Colors.black,
          backgroundColor: Colors.blue,
          shadowColor: Colors.black,
          disabledForegroundColor: Colors.grey,
          disabledBackgroundColor: Colors.grey,
          minimumSize: const Size(double.infinity, 50),
          maximumSize: const Size(double.infinity, 50),
          side: const BorderSide(color: Colors.blue, width: 1),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
          textStyle: const TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap));
}
