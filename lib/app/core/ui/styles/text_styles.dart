import 'package:flutter/material.dart';

import 'colors_app.dart';

class TextStyles {
  static TextStyles? _instance;
  // Avoid self isntance
  TextStyles._();
  static TextStyles get i {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get primaryFont => 'Poppins';
  String get secundaryFont => 'MPlus1P';

  // primary font
  TextStyle get textPrimaryFontRegular => TextStyle(
        fontFamily: primaryFont,
        fontWeight: FontWeight.normal,
      );

  TextStyle get textPrimaryFontMedium => TextStyle(
        fontFamily: primaryFont,
        fontWeight: FontWeight.w600,
      );

  TextStyle get textPrimaryFontSemiBold => TextStyle(
        fontFamily: primaryFont,
        fontWeight: FontWeight.w600,
      );

  TextStyle get textPrimaryFontBold => TextStyle(
        fontFamily: primaryFont,
        fontWeight: FontWeight.bold,
      );

  TextStyle get textPrimaryFontExtraBold => TextStyle(
        fontFamily: primaryFont,
        fontWeight: FontWeight.w800,
      );

  // primary font
  TextStyle get textSecundaryFontRegular => TextStyle(
        fontFamily: secundaryFont,
        fontWeight: FontWeight.normal,
      );

  TextStyle get textSecundaryFontMedium => TextStyle(
        fontFamily: secundaryFont,
        fontWeight: FontWeight.w500,
      );

  TextStyle get textSecundaryFontBold => TextStyle(
        fontFamily: secundaryFont,
        fontWeight: FontWeight.bold,
      );

  TextStyle get textSecundaryFontExtraBold => TextStyle(
        fontFamily: secundaryFont,
        fontWeight: FontWeight.w800,
      );

  TextStyle get labelTextField =>
      textSecundaryFontRegular.copyWith(color: ColorsApp.i.greyDark);

  TextStyle get textSecundadryFontExtraBolPrimaryColor =>
      textSecundaryFontExtraBold.copyWith(color: ColorsApp.i.primary);

  TextStyle get titleWhite => textPrimaryFontBold.copyWith(
        color: Colors.white,
        fontSize: 22,
      );

  TextStyle get titleBlack => textPrimaryFontBold.copyWith(
        color: Colors.black,
        fontSize: 22,
      );
}

extension TextStylesExtension on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
