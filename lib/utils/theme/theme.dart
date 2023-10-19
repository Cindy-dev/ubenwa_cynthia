library theme;

import 'package:flutter/material.dart';
import 'colors_theme_extension.dart';
part 'app_colors.dart';
part 'app_fonts.dart';
part 'text_styles.dart';

final ThemeData appTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  const Color primaryColor = _Colors.blue;
  const Color secondaryColor = _Colors.yellow;
  const Color tertiaryColor = _Colors.lightBlack;

  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
    error: Colors.red,
    tertiary: tertiaryColor,
  );
  final themeData = ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: _Colors.white,
    hintColor: _Colors.black,
    highlightColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: _Colors.white,
      centerTitle: true,
      elevation: 0,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: _Colors.white,
      shape: CircularNotchedRectangle(),
    ),
    snackBarTheme: SnackBarThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      behavior: SnackBarBehavior.fixed,
      contentTextStyle: AppTextStyles.headingSemiBold,
      insetPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
    ),
    dividerColor: _Colors.black,
    dialogTheme: const DialogTheme(
      backgroundColor: _Colors.white,
      contentTextStyle: AppTextStyles.headingSemiBold,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: AppTextStyles.headingBold.copyWith(color: _Colors.white),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3),
        borderSide: BorderSide(color: _Colors.black.withOpacity(0.5)),
      ),
      isDense: true,
      hintStyle: AppTextStyles.subtitle1.copyWith(color: _Colors.black),
    ),
    cardTheme: const CardTheme(
      color: _Colors.white,
      surfaceTintColor: _Colors.white,
    ),
    textTheme: const TextTheme(
      displayLarge: AppTextStyles.displayLarge,
      headlineLarge: AppTextStyles.headingBold,
      headlineMedium: AppTextStyles.headingSemiBold,
      titleLarge: AppTextStyles.headingSemiBold,

      titleMedium: AppTextStyles.bodySemiBold,
      bodyMedium: AppTextStyles.bodyMedium,
      bodyLarge: AppTextStyles.bodySemiBold,
      bodySmall: AppTextStyles.subtitle1,
      labelSmall: AppTextStyles.small,
    ),
    dialogBackgroundColor: _Colors.white,
    extensions: [
      ColorThemeExt(
        blue: _Colors.blue,
        black: _Colors.black,
        yellow: _Colors.yellow,
        white: _Colors.white,
        lightBlack: _Colors.lightBlack,
      ),
    ],
  );
  return themeData;
}
