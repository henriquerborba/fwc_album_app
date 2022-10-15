import 'dart:math';

import 'package:flutter/material.dart';

import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

class StickerPercent extends StatelessWidget {
  final int percent;

  const StickerPercent({
    Key? key,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colors.grey,
          ),
          child: Center(
            child: Text(
              '$percent%',
              style: context.textStyles.titlePrimaryColor,
            ),
          ),
        ),
        SizedBox(
          width: 110,
          height: 110,
          child: Transform.rotate(
            angle: -pi / 2.5,
            child: CircularProgressIndicator(
              value: percent / 100,
              color: Colors.white,
              strokeWidth: 5,
              backgroundColor: Colors.white.withOpacity(.5),
            ),
          ),
        )
      ],
    );
  }
}
