import 'package:flutter/material.dart';
import 'package:orderlens/core/theming/colors_manager.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: ColorsManager.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorsManager.black,
      ),
    );
  }
}
