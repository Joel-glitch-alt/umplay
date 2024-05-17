import 'package:flutter/material.dart';
import 'package:umplay/config/theme/custom_themes/app_bar_theme.dart';
import 'package:umplay/config/theme/custom_themes/elevated_button_theme.dart';
import 'package:umplay/config/theme/custom_themes/input_decoration_theme.dart';
import 'package:umplay/config/theme/custom_themes/outline_button_theme.dart';
import 'package:umplay/config/theme/custom_themes/text_theme.dart';

class UThemeData {
  UThemeData._();

  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: UTextTheme.lightTextTheme,
    appBarTheme: UAppBarTheme.lightAppBarTheme,
    inputDecorationTheme: UInputDecorationTheme.lightInputDecorationTheme,
    elevatedButtonTheme: UElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: UOutlineButtonTheme.lightOutlineButtonTheme,
  );
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: UTextTheme.darkTextTheme,
    appBarTheme: UAppBarTheme.darkAppBarTheme,
    inputDecorationTheme: UInputDecorationTheme.darkInputDecorationTheme,
    elevatedButtonTheme: UElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: UOutlineButtonTheme.darkOutlineButtonTheme,
  );
}
