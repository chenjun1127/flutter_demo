import 'dart:ui';

import 'package:flutter/material.dart';

import 'colors.dart';

/// Created by chenjun on 2022/3/30.
class FontWeightStyle {
  static FontWeight fontWeightMini = FontWeight.w600;
}

class FontFamily {
  static String mainFontFamily = "PingFang";
  static String roboto_regular = "Roboto-Regular";
  static String roboto_black = "Roboto-Black";
  static String roboto_thin = "Roboto-Thin";
}

class FontSize {
  static double bigTitle = 28;
  static double title = 26;
  static double navTitle = 24;
  static double subTitle = 22;
  static double smallSubTitle = 20;
  static double content = 16;
  static double annotation = 14;
  static double smallSize = 12;
}

class FontStyle {
  static TextStyle defaultTitle = TextStyle(
    fontFamily: 'PingFang',
    fontFamilyFallback: const ['NanumGothic-Regular'],
    decoration: TextDecoration.none,
    fontWeight: FontWeightStyle.fontWeightMini,
  );
  static TextStyle bigTitle = defaultTitle.copyWith(
    fontSize: FontSize.bigTitle,
    fontWeight: FontWeightStyle.fontWeightMini,
    color: AppColors.primary,
    decoration: TextDecoration.none,
    fontFamily: FontFamily.mainFontFamily,
  );
}
