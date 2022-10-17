import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/pages/my_stickers/presenter/my_stickers_presenter.dart';

import '../../../core/ui/widgets/button.dart';

class StickerStatusFilter extends StatelessWidget {
  final String filterSlected;

  const StickerStatusFilter({
    Key? key,
    required this.filterSlected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = context.get<MyStickersPresenter>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 5,
        children: [
          Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {
              presenter.statusFilter('all');
            },
            label: 'Todas',
            labelStyle: filterSlected == 'all'
                ? context.textStyles.textSecundaryFontMedium
                    .copyWith(color: context.colors.primary)
                : context.textStyles.textSecundaryFontMedium,
            style: filterSlected == 'all'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primaryButton,
          ),
          Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {
              presenter.statusFilter('missing');
            },
            label: 'Faltando',
            labelStyle: filterSlected == 'missing'
                ? context.textStyles.textSecundaryFontMedium
                    .copyWith(color: context.colors.primary)
                : context.textStyles.textSecundaryFontMedium,
            style: filterSlected == 'missing'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primaryButton,
          ),
          Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {
              presenter.statusFilter('repeated');
            },
            label: 'Repetidas',
            labelStyle: filterSlected == 'repeated'
                ? context.textStyles.textSecundaryFontMedium
                    .copyWith(color: context.colors.primary)
                : context.textStyles.textSecundaryFontMedium,
            style: filterSlected == 'repeated'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primaryButton,
          ),
        ],
      ),
    );
  }
}
