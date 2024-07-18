import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peak_mates/core/res/colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.lightColor,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(
        color: AppColors.primaryColor,
        fontSize: 48,
      ),
      bodyLarge: GoogleFonts.inter(
        color: AppColors.lightColor,
        fontSize: 20,
      ),
    ),
  );
}
