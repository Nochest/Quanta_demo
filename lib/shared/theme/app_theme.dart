import 'package:flutter/material.dart';
import 'package:quanta_demo_app/shared/theme/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.appRed,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
      ));
}
