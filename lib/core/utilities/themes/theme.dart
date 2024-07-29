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
    scaffoldBackgroundColor: AppColors.bgColorDark,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.bgColorDark,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.grayLightColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.bgColorDark,
      elevation: 0,
      foregroundColor: AppColors.primaryColor,
      titleTextStyle: GoogleFonts.inter(
        color: AppColors.primaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(AppColors.primaryColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        side: WidgetStateProperty.all(
          const BorderSide(
            color: AppColors.primaryColor,
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.bgColorDark.withOpacity(.5),
      hintStyle: GoogleFonts.inter(
        color: AppColors.grayLightColor,
      ),
      prefixIconColor: AppColors.primaryColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.grayDarkColor,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
          width: 1,
        ),
      ),
      labelStyle: const TextStyle(
        color: AppColors.primaryColor,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
      selectionColor: AppColors.primaryColor.withOpacity(.5),
      selectionHandleColor: AppColors.primaryColor,
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
    listTileTheme: ListTileThemeData(
      tileColor: AppColors.grayDarkColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      titleTextStyle: GoogleFonts.inter(
        color: AppColors.lightColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      iconColor: AppColors.primaryColor,
    ),
  );
}
