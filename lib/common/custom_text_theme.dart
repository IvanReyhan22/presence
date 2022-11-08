import 'package:flutter/material.dart';
import 'package:presence/common/app_constants.dart';

/// 2021 Material Design typography scheme more info at :
/// https://api.flutter.dev/flutter/material/TextTheme-class.html

const customTextTheme = TextTheme(
  displayLarge: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.4,
      color: AppConstants.black),
  displayMedium: TextStyle(
      fontSize: 44,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.4,
      color: AppConstants.black),
  displaySmall: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.4,
      color: AppConstants.black),

  // Equals to headline 1 - headline 3
  headlineLarge: TextStyle(
      fontSize: 36, fontWeight: FontWeight.bold, color: AppConstants.black),
  headlineMedium: TextStyle(
      fontSize: 32, fontWeight: FontWeight.bold, color: AppConstants.black),
  headlineSmall: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppConstants.black,
  ),

  // Equals to headline 4 - headline 6
  titleLarge: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppConstants.black,
  ),
  titleMedium: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppConstants.black,
  ),
  titleSmall: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppConstants.black,
  ),

  labelLarge: TextStyle(
      fontSize: 18, fontWeight: FontWeight.w500, color: AppConstants.black),

  bodyLarge: TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: AppConstants.black),
  bodyMedium: TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppConstants.black),
  bodySmall: TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: AppConstants.black),
);
