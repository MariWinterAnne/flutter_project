import 'package:flutter/material.dart';

abstract class AppColors {
  static Color get blackColor => Colors.black;
  static Color get whiteColor => Colors.white;
  static Color get greyColor => Colors.grey;

  static Color get primaryColor => whiteColor;
  static Color get secondaryColor => greyColor;
  static Color get darkPrimaryColor => const Color(0xFF181f29);
  static Color get darkSecondaryColor => const Color(0xFF1c2b3c);
  static Color get elementsColor => const Color(0xFF207acc);
}
