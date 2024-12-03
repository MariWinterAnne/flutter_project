import 'package:flutter/material.dart';
import 'colors.dart';

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = true;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.primaryColor,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          titleTextStyle: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 14,
            color: AppColors.blackColor,
          )),
      buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: AppColors.elementsColor,
      ),
      tabBarTheme: TabBarTheme(
        tabAlignment: TabAlignment.start,
        labelColor: AppColors.elementsColor,
        indicatorColor: AppColors.elementsColor,
        unselectedLabelColor: AppColors.greyColor,
      ),
      iconButtonTheme: IconButtonThemeData(
          style:
              IconButton.styleFrom(foregroundColor: AppColors.elementsColor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.elementsColor,
        unselectedItemColor: AppColors.greyColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: TextStyle(
          fontSize: 14,
          overflow: TextOverflow.ellipsis,
          color: AppColors.blackColor,
        ),
        subtitleTextStyle: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 12,
          color: AppColors.greyColor,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      cardTheme: CardTheme(color: AppColors.primaryColor),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.primaryColor,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      textTheme: const TextTheme().copyWith(
        bodySmall: TextStyle(color: AppColors.whiteColor),
        bodyMedium: TextStyle(color: AppColors.whiteColor),
      ),
      scaffoldBackgroundColor: AppColors.darkPrimaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkPrimaryColor,
        titleTextStyle: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: AppColors.whiteColor,
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: AppColors.elementsColor,
      ),
      tabBarTheme: TabBarTheme(
        tabAlignment: TabAlignment.start,
        labelColor: AppColors.elementsColor,
        indicatorColor: AppColors.elementsColor,
        unselectedLabelColor: AppColors.greyColor,
      ),
      iconButtonTheme: IconButtonThemeData(
          style:
              IconButton.styleFrom(foregroundColor: AppColors.elementsColor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkPrimaryColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.elementsColor,
        unselectedItemColor: AppColors.greyColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: TextStyle(
          fontSize: 14,
          overflow: TextOverflow.ellipsis,
          color: AppColors.whiteColor,
        ),
        subtitleTextStyle: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 12,
          color: AppColors.greyColor,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      cardTheme: CardTheme(color: AppColors.darkSecondaryColor),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSecondaryColor,
      ),
    );
  }
}
