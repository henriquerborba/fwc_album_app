import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

import '../../../core/ui/widgets/button.dart';

class StickerStatusFilter extends StatelessWidget {
  final String filterSlected;

  const StickerStatusFilter({
    Key? key,
    required this.filterSlected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 5,
        children: [
          Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {},
            label: 'Todas',
            labelStyle: context.textStyles.textSecundaryFontMedium
                .copyWith(color: context.colors.primary),
            style: context.buttonStyles.yellowButton,
          ),
          Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {},
            label: 'Faltando',
            labelStyle: context.textStyles.textSecundaryFontMedium,
            style: context.buttonStyles.primaryButton,
          ),
          Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {},
            label: 'Repetidas',
            labelStyle: context.textStyles.textSecundaryFontMedium,
            style: context.buttonStyles.primaryButton,
          ),
        ],
      ),
    );
  }
}
