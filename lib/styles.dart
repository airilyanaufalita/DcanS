import 'package:flutter/material.dart';

class AppColors {
  static const lightBlue = Color(0xFF7699A4);
  static const darkBlue = Color(0xFF33606E);
}

class TextStyles {
  static TextStyle title = const TextStyle(
    fontFamily: 'Outfit',
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
    color: AppColors.darkBlue,
  );

  static TextStyle body = const TextStyle(
    fontFamily: 'Outfit',
    fontWeight: FontWeight.normal,
    fontSize: 16.0,
    color: AppColors.darkBlue,
  );
}
