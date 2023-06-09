import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color green = Color(0xFF379683);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray = Color(0xFF5D5C61);
  static const Color cyan = Color(0xFF7395AE);
  static const Color blue = Color(0xFF557A95);
  static const Color blueDiff = Color(0xFF0ABAB5);
  static const Color purpleDiff = Color(0xFF8A00C2);

  static const purpleBLue = LinearGradient(
  // begin: Alignment.centerLeft,
  // end: Alignment.centerRight,
  stops: [0.10, 0.90],
  colors: <Color>[purpleDiff, blueDiff],);
}
