import 'package:aviz/data/constants/colors.dart';
import 'package:flutter/material.dart';

String appFontFamily = 'Shabnam';

ThemeData mainTheme() {
  return ThemeData(
    fontFamily: appFontFamily,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: grey700Color,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: grey400Color,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: grey500Color,
      ),
    ),
  );
}
