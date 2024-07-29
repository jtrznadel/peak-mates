import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peak_mates/core/res/colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.grayDarkColor,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(
        color: AppColors.primaryColor,
        fontSize: 48,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.inter(
        color: AppColors.grayDarkColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.inter(
        color: AppColors.primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.inter(
        color: AppColors.darkTextColor,
        fontSize: 20,
      ),
      bodyMedium: GoogleFonts.inter(
        color: AppColors.darkTextColor,
        fontSize: 16,
      ),
      bodySmall: GoogleFonts.inter(
        color: AppColors.lightTextColor,
        fontSize: 12,
      ),
      labelLarge: GoogleFonts.inter(
        color: AppColors.darkTextColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: GoogleFonts.inter(
        color: AppColors.grayLightColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: GoogleFonts.inter(
        color: AppColors.grayDarkColor,
        fontSize: 14,
      ),
    ),
    scaffoldBackgroundColor: AppColors.bgColorLight,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.bgColorLight,
      selectedItemColor: AppColors.grayDarkColor,
      unselectedItemColor: AppColors.grayLightColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.bgColorLight,
      elevation: 0,
      foregroundColor: AppColors.grayDarkColor,
      titleTextStyle: GoogleFonts.inter(
        color: AppColors.grayDarkColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.grayDarkColor,
      ),
      actionsIconTheme: const IconThemeData(
        color: AppColors.grayDarkColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.grayDarkColor),
        textStyle: WidgetStateProperty.all(
          GoogleFonts.inter(
            fontSize: 16,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        foregroundColor: WidgetStateProperty.all(AppColors.primaryColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(AppColors.grayDarkColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        side: WidgetStateProperty.all(
          const BorderSide(
            color: AppColors.grayDarkColor,
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.bgColorLight,
      hintStyle: GoogleFonts.inter(
        color: AppColors.grayLightColor,
        fontSize: 14,
      ),
      prefixIconColor: AppColors.grayDarkColor,
      suffixIconColor: AppColors.grayDarkColor,
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
          color: AppColors.grayDarkColor,
          width: 2,
        ),
      ),
      labelStyle: const TextStyle(
        color: AppColors.grayDarkColor,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.grayDarkColor,
      selectionColor: AppColors.grayDarkColor.withOpacity(.5),
      selectionHandleColor: AppColors.grayDarkColor,
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
      tileColor: AppColors.cardLightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      titleTextStyle: GoogleFonts.inter(
        color: AppColors.darkTextColor,
        fontSize: 16,
      ),
      subtitleTextStyle: GoogleFonts.inter(
        color: AppColors.grayLightColor,
        fontSize: 12,
      ),
      iconColor: AppColors.grayDarkColor,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(AppColors.grayDarkColor),
      trackColor: WidgetStateProperty.all(AppColors.grayLightColor),
      trackOutlineColor: WidgetStateProperty.all(AppColors.grayLightColor),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(
        color: AppColors.primaryColor,
        fontSize: 48,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.inter(
        color: AppColors.primaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.inter(
        color: AppColors.primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.inter(
        color: AppColors.lightTextColor,
        fontSize: 20,
      ),
      bodyMedium: GoogleFonts.inter(
        color: AppColors.lightTextColor,
        fontSize: 16,
      ),
      bodySmall: GoogleFonts.inter(
        color: AppColors.lightTextColor,
        fontSize: 12,
      ),
      labelLarge: GoogleFonts.inter(
        color: AppColors.lightTextColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: GoogleFonts.inter(
        color: AppColors.grayLightColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: GoogleFonts.inter(
        color: AppColors.lightTextColor,
        fontSize: 14,
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
      foregroundColor: AppColors.grayDarkColor,
      titleTextStyle: GoogleFonts.inter(
        color: AppColors.primaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.primaryColor,
      ),
      actionsIconTheme: const IconThemeData(
        color: AppColors.primaryColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
        textStyle: WidgetStateProperty.all(
          GoogleFonts.inter(
            fontSize: 16,
            color: AppColors.grayDarkColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        foregroundColor: WidgetStateProperty.all(AppColors.grayDarkColor),
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
        fontSize: 16,
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
      tileColor: AppColors.cardDarkColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      titleTextStyle: GoogleFonts.inter(
        color: AppColors.lightTextColor,
        fontSize: 16,
      ),
      subtitleTextStyle: GoogleFonts.inter(
        color: AppColors.grayLightColor,
        fontSize: 12,
      ),
      iconColor: AppColors.primaryColor,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.primaryColor,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(AppColors.primaryColor),
      trackColor: WidgetStateProperty.all(AppColors.grayDarkColor),
      trackOutlineColor: WidgetStateProperty.all(AppColors.grayDarkColor),
    ),
  );
}
