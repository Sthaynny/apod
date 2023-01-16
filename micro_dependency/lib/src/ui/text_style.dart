import 'package:flutter/material.dart';

abstract class AppStyle {
  static TextStyle h1({
    Color? color,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        color: color ?? Colors.white,
        fontSize: 18,
        fontWeight: fontWeight ?? FontWeight.w600,
      );
  static TextStyle h2({
    Color? color,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        color: color ?? Colors.white,
        fontSize: 16,
        fontWeight: fontWeight ?? FontWeight.w600,
      );
  static TextStyle h3({
    Color? color,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        color: color ?? Colors.white,
        fontSize: 14,
        fontWeight: fontWeight ?? FontWeight.w600,
      );
  static TextStyle regular({
    Color? color,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        color: color ?? Colors.white,
        fontSize: 14,
        fontWeight: fontWeight ?? FontWeight.w600,
      );
}
