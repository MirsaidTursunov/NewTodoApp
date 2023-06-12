import 'package:flutter/material.dart';
import 'package:new_todo_app/constants/theme/app_colors.dart';

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.mainBlue,
    primary: AppColors.mainBlue,
    background: AppColors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.white,
  ),
  scaffoldBackgroundColor: AppColors.white,
  useMaterial3: true,
  fontFamily: 'Poppins',
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);