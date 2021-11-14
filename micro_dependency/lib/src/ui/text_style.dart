import 'package:flutter/material.dart';

import '../adaptable_screen/adaptable_screen.dart';

abstract class AppStyle {
  static TextStyle h1({
    Color? color,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        color: color ?? Colors.white,
        fontSize: 18.ssp,
        fontWeight: fontWeight ?? FontWeight.w600,
      );
  static TextStyle h2({
    Color? color,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        color: color ?? Colors.white,
        fontSize: 16.ssp,
        fontWeight: fontWeight ?? FontWeight.w600,
      );
  static TextStyle h3({
    Color? color,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        color: color ?? Colors.white,
        fontSize: 14.ssp,
        fontWeight: fontWeight ?? FontWeight.w600,
      );
  static TextStyle regular({
    Color? color,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        color: color ?? Colors.white,
        fontSize: 14.ssp,
        fontWeight: fontWeight ?? FontWeight.w600,
      );
}
