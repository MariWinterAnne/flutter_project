import 'package:flutter/material.dart';
import 'chat/autoroute/main.dart';
import 'chat/bloc/main.dart';
import 'chat/theme/colors.dart';

final appTheme = ThemeData(scaffoldBackgroundColor: AppColors.darkThemeColor);

void main() {
  //Autoroute & SplitView
  //runApp(const AutoRouteEntryWidget());

  //Bloc
  runApp(const BlocEntryWidget());
}