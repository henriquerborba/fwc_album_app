import 'package:flutter/material.dart';

import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/models/groups_stickers.dart';
import 'package:fwc_album_app/app/models/user_sticker_model.dart';

class StickerGroup extends StatelessWidget {
  final GroupsStickers group;
  final String statusFilter;

  const StickerGroup(
      {super.key, required this.group, required this.statusFilter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 64,
            child: OverflowBox(
              maxWidth: double.infinity,
              maxHeight: double.infinity,
              child: ClipRect(
                child: Align(
                  alignment: const Alignment(0, -0.1),
                  widthFactor: 1,
                  heightFactor: 0.1,
                  child: Image.network(
                    group.flag,
                    cacheWidth: (MediaQuery.of(context).size.width * 3).toInt(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              group.countryName,
              style: context.textStyles.titleBlack.copyWith(fontSize: 26),
            ),
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final stickerNumber = '${group.stickersStart + index}';
              final stickerList = group.stickers
                  .where((sticker) => sticker.stickerNumer == stickerNumber)
                  .toList();

              final sticker = stickerList.isNotEmpty ? stickerList.first : null;

              final stickerWidget = Sticker(
                stickerNumber: stickerNumber,
                sticker: sticker,
                countryNme: group.countryName,
                countryCode: group.countryCode,
              );

              if (statusFilter == 'all') {
                return stickerWidget;
              } else if (statusFilter == 'missing') {
                if (sticker == null) {
                  return stickerWidget;
                }
              } else if (statusFilter == 'repeated') {
                if (sticker != null && sticker.duplicate > 0) {
                  return stickerWidget;
                }
              }

              return const SizedBox.shrink();
            },
            itemCount: 20,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          )
        ],
      ),
    );
  }
}

class Sticker extends StatelessWidget {
  final String stickerNumber;
  final UserStickerModel? sticker;
  final String countryNme;
  final String countryCode;

  const Sticker({
    Key? key,
    this.sticker,
    required this.stickerNumber,
    required this.countryNme,
    required this.countryCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        color: sticker != null ? context.colors.primary : context.colors.grey,
        child: Column(
          children: [
            Visibility(
              visible: (sticker?.duplicate ?? 0) > 0,
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
              child: Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(2),
                child: Text(
                  sticker?.duplicate.toString() ?? '',
                  style: context.textStyles.textSecundaryFontMedium
                      .copyWith(color: context.colors.yellow),
                ),
              ),
            ),
            Text(
              countryCode,
              style: context.textStyles.textSecundaryFontExtraBold.copyWith(
                color: sticker != null ? Colors.white : Colors.black,
              ),
            ),
            Text(
              stickerNumber,
              style: context.textStyles.textSecundaryFontExtraBold.copyWith(
                color: sticker != null ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
