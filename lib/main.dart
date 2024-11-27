import 'package:flutter/material.dart';
import 'chat/autoroute/main.dart';
import 'chat/modular/main.dart';
import 'chat/theme/colors.dart';

final appTheme = ThemeData(scaffoldBackgroundColor: AppColors.darkPrimaryColor);

void main() async {
  //runApp(const AutoRouteEntryWidget());
  runApp(const ModularEntryWidget());
}