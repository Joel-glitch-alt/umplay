import 'package:flutter/material.dart';

class Styles {
  Styles._();

  static BoxDecoration gradientBoxDecoration({
    required List<Color> colors,
    required AlignmentGeometry begin,
    required AlignmentGeometry end,
    List<double>? stops,
  }) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: begin,
        end: end,
        colors: colors,
        stops: stops,
      ),
    );
  }
}
