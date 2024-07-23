import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peak_mates/core/res/colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(
        color: AppColors.primaryColor,
        fontSize: 48,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.inter(
        color: AppColors.lightColor,
        fontSize: 20,
      ),
      bodyMedium: GoogleFonts.inter(
        color: AppColors.lightColor,
        fontSize: 16,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.primaryColor.withOpacity(.2),
      hintStyle: GoogleFonts.inter(
        color: AppColors.grayLightColor,
      ),
      prefixIconColor: AppColors.primaryColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(AppColors.primaryColor),
        textStyle: WidgetStateProperty.all(
          GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}
