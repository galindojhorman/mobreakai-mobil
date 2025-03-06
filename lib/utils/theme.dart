import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.main,
    secondary: AppColors.highlight,
    surface: Colors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: AppColors.alternate,
    onError: Colors.white,
  ),
  useMaterial3: true,
);
