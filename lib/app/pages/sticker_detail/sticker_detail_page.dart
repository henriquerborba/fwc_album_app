import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/rouded_button.dart';
import 'package:fwc_album_app/app/pages/sticker_detail/presenter/sticker_detail_presenter.dart';
import 'package:fwc_album_app/app/pages/sticker_detail/view/sticker_detail_view_impl.dart';

import '../../core/ui/widgets/button.dart';

class StickerDetailPage extends StatefulWidget {
  const StickerDetailPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final StickerDetailPresenter presenter;

  @override
  State<StickerDetailPage> createState() => _StickerDetailPageState();
}

class _StickerDetailPageState extends StickerDetailViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe figurinha'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                hasSticker
                    ? 'assets/images/sticker.png'
                    : 'assets/images/sticker_pb.png',
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '$countryCode $stickerNumber',
                      style: context.textStyles.textPrimaryFontBold
                          .copyWith(fontSize: 22),
                    ),
                  ),
                  const Spacer(),
                  RoundedButton(
                    onPressed: widget.presenter.decrementAmount,
                    icon: Icons.remove,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      amount.toString(),
                      style: context.textStyles.textPrimaryFontMedium,
                    ),
                  ),
                  RoundedButton(
                    onPressed: widget.presenter.incrementAmount,
                    icon: Icons.add,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  countryName,
                  style: context.textStyles.textPrimaryFontRegular,
                ),
              ),
              Button.primary(
                label:
                    hasSticker ? 'Atualizar Figurinha' : 'Adicionar Figurinha',
                onPressed: widget.presenter.saveSticker,
                width: MediaQuery.of(context).size.width * .9,
              ),
              Button(
                label: 'Excluir figurinha',
                onPressed: widget.presenter.deleteSticker,
                width: MediaQuery.of(context).size.width * .9,
                outline: true,
                style: context.buttonStyles.primaryOutlinedButton,
                labelStyle:
                    context.textStyles.textSecundadryFontExtraBolPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
