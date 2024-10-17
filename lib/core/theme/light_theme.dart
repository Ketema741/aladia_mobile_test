import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  primaryColorLight: AppColors.primaryColor,
  primarySwatch: Colors.deepPurple,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.primaryColor,
    selectionColor: Color.fromARGB(255, 129, 141, 230),
  ),
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
  useMaterial3: true,
);
