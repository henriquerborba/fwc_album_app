import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

class ButtonStyles {
  static ButtonStyles? _instance;

  ButtonStyles._();

  static ButtonStyles get i {
    _instance ??= ButtonStyles._();
    return _instance!;
  }

  ButtonStyle get yellowButton => ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.i.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        textStyle: TextStyles.i.textSecundaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
      );

  ButtonStyle get yellowOutlinedButton => OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        side: BorderSide(color: ColorsApp.i.yellow),
        textStyle: TextStyles.i.textSecundaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
      );

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.i.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        textStyle: TextStyles.i.textSecundaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
      );

  ButtonStyle get primaryOutlinedButton => OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        side: BorderSide(color: ColorsApp.i.primary),
        textStyle: TextStyles.i.textSecundaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
      );
}

extension ButtonStyleExtension on BuildContext {
  ButtonStyles get buttonStyles => ButtonStyles.i;
}
