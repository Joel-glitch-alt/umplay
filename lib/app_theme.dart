import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umplay/utils/constant.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/colors.dart';

class AppTheme {
  //
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: createMaterialColor(primaryColor),
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldPrimaryLight,
      fontFamily: GoogleFonts.dmSans().fontFamily,
      useMaterial3: true,
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: Colors.white),
      iconTheme: IconThemeData(color: textPrimaryColorGlobal),
      textTheme: GoogleFonts.lexendDecaTextTheme(),
      dialogBackgroundColor: Colors.white,
      unselectedWidgetColor: Colors.black,
      dividerColor: borderColor,
      bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(
            borderRadius:
                radiusOnly(topLeft: DEFAULT_RADIUS, topRight: DEFAULT_RADIUS)),
        backgroundColor: Colors.white,
      ),
      cardColor: cardColor,
      appBarTheme: AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light)),
      dialogTheme: DialogTheme(shape: dialogShape()),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: createMaterialColor(primaryColor),
      primaryColor: primaryColor,
      appBarTheme: AppBarTheme(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      ),
      scaffoldBackgroundColor: scaffoldDarkColor,
      fontFamily: GoogleFonts.dmSans().fontFamily,
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: scaffoldSecondaryDark),
      iconTheme: IconThemeData(color: Colors.white),
      textTheme: GoogleFonts.lexendDecaTextTheme(),
      dialogBackgroundColor: scaffoldSecondaryDark,
      unselectedWidgetColor: Colors.white60,
      useMaterial3: true,
      bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(
            borderRadius:
                radiusOnly(topLeft: DEFAULT_RADIUS, topRight: DEFAULT_RADIUS)),
        backgroundColor: scaffoldDarkColor,
      ),
      dividerColor: dividerDarkColor,
      cardColor: cardDarkColor,
      dialogTheme: DialogTheme(shape: dialogShape()),
    );
  }
}
