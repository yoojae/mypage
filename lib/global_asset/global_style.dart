// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Global Variable
class GlobalStyle {
  // 색상 글로벌
  static const Color orot_bg = Color(0xFFffffff);
  static const Color orot_primary = Color(0xFF7a65e8);
  static const Color orot_primary_dark = Color(0xFF7465e8);
  static const Color orot_primary_darker = Color(0xFF391ec8);
  static const Color orot_primary_light = Color(0xFF9f90fe);
  static const Color orot_primary_lighter = Color(0xFFc5bcf5);

  static const Color orot_secondary = Color(0xFFb24ee4);
  static const Color orot_secondary_dark = Color(0xFF7f1bb1);
  static const Color orot_secondary_darker = Color(0xFF7f1bb1);
  static const Color orot_secondary_light = Color(0xFFd9a6f2);
  static const Color orot_secondary_lighter = Color(0xFFecd3f8);

  static const Color orot_accent = Color(0xFFfad77a);
  static const Color orot_accent_dark = Color(0xFFf8c849);
  static const Color orot_accent_darker = Color(0xFFf7ba18);
  static const Color orot_accent_darkest = Color(0xffff945a);
  static const Color orot_accent_light = Color(0xFFfce6ab);
  static const Color orot_accent_lighter = Color(0xFFfef5dd);

  static const Color orot_error = Color(0xFFed5556);
  static const Color orot_error_dark = Color(0xFFe82627);
  static const Color orot_error_light = Color(0xFFf7b1b1);

  static const Color orot_white = Color(0xFFffffff);
  static const Color orot_gray_dark = Color(0xFFadbdcc);
  static const Color orot_gray_darker = Color(0xFF8595a6);
  static const Color orot_gray_darkest = Color(0xFF475259);
  static const Color orot_black = Color(0xFF1e2225);
  static const Color orot_gray_lightest = Color(0xFFf5f7fa);
  static const Color orot_gray_lighter = Color(0xFFcfdae6);
  static const Color orot_gray_light = Color(0xFFbfccd9);
  static const Color orot_gray = Color(0x408595a6);
  static const Color orot_high = Color(0xffff772e);

  // 폰트 글꼴 크기 글로벌 변수
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extra_light = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semi_bold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extra_bold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;

  static TextStyle setTextStyle(
    String fontSize,
    String fontWeight,
    Color textColor, {
    TextDecoration? decoration,
    Color? decorationColor,
    double? height,
  }) {
    FontWeight fw;
    double? fs;
    switch (fontSize) {
      case "h1":
        fs = 30.sp;
        break;
      case "h2":
        fs = 24.sp;
        break;
      case "h3":
        fs = 18.sp;
        break;
      case "h4":
        fs = 16.sp;
        break;
      case "h5":
        fs = 15.sp;
        break;
      case "h6":
        fs = 14.sp;
        break;
      case "h7":
        fs = 13.sp;
        break;
      case "h8":
        fs = 12.sp;
        break;
      case "h20":
        fs = 20.sp;
        break;
      default:
    }

    switch (fontWeight) {
      case "thin":
        fw = FontWeight.w100;
        break;
      case "extra_light":
        fw = FontWeight.w200;
        break;
      case "light":
        fw = FontWeight.w300;
        break;
      case "regular":
        fw = FontWeight.w400;
        break;
      case "medium":
        fw = FontWeight.w500;
        break;
      case "semi_bold":
        fw = FontWeight.w600;
        break;
      case "bold":
        fw = FontWeight.w700;
        break;
      case "extra_bold":
        fw = FontWeight.w800;
        break;
      case "black":
        fw = FontWeight.w900;
        break;
      default:
        fw = FontWeight.w400;
        break;
    }

    return TextStyle(
        fontFamily: 'Pretendard',
        letterSpacing: -0.5.w,
        color: textColor,
        fontWeight: fw,
        fontSize: fs,
        decoration: decoration ?? _decoration,
        decorationColor: decorationColor ?? _color,
        height: height);
  }

  static const TextDecoration _decoration = TextDecoration.none;
  static const Color _color = Color(0xFF7a65e8);
  // static const Color _color_edit = Color(0xFF7a65e8);
}
