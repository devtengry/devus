import 'package:devus/common/sizes.dart';
import 'package:devus/theme/color_palette.dart';
import 'package:flutter/material.dart';

ThemeData customLightTheme = ThemeData(
  brightness: Brightness.light,

  scaffoldBackgroundColor: kLightBackground,
  primaryColor: kLightMain,
  colorScheme: const ColorScheme.light(
    primary: kLightMain,
    secondary: kLightSecondary,
    surface: kLightSurface,
    onPrimary: kLightAccent,
    onSecondary: kLightAccent,
  ),

  // Text Theme
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: kLightText),
    bodyMedium: TextStyle(color: kLightText),
    titleLarge: TextStyle(color: kLightText),
    titleMedium: TextStyle(color: kLightText),
    labelLarge: TextStyle(color: kLightText),
  ),

  // Input Theme
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: kLightSurface,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
  ),

  // ElevatedButton Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(kLightMain),
      foregroundColor: WidgetStateProperty.all<Color>(kLightAccent),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  ),
);

ThemeData customDarkTheme = ThemeData(
  brightness: Brightness.dark,

  scaffoldBackgroundColor: kDarkBackground,
  primaryColor: kDarkMain,
  colorScheme: const ColorScheme.dark(
    primary: kDarkMain,
    secondary: kDarkSecondary,
    surface: kDarkSurface,
    onPrimary: kDarkAccent,
    onSecondary: kDarkAccent,
  ),

  // Text Theme
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: kDarkText),
    bodyMedium: TextStyle(color: kDarkText),
    titleLarge: TextStyle(color: kDarkText),
    titleMedium: TextStyle(color: kDarkText),
    labelLarge: TextStyle(color: kDarkText),
  ),

  // Input Theme
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: kDarkSurface,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ScreenSize.kRadiusSmall),
      borderSide: BorderSide.none,
    ),
  ),

  // ElevatedButton Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(kDarkMain),
      foregroundColor: WidgetStateProperty.all<Color>(kDarkSecondary),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenSize.kRadiusSmall),
        ),
      ),
    ),
  ),
);
