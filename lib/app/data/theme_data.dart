import 'package:flutter/material.dart';
import 'package:todo_list_app/app/data/color_const.dart';

class AppThemeData {
  static ThemeData themeData = ThemeData(
    appBarTheme: const AppBarTheme(
        color: AppColors.primaryColor,
        titleTextStyle: TextStyle(color: AppColors.whiteColor, fontSize: 22),
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        centerTitle: true),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
            textStyle: WidgetStateProperty.all(
                const TextStyle(color: AppColors.whiteColor)))),
  );
}
