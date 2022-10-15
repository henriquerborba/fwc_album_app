import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/pages/home/wigets/status_tile.dart';
import 'package:fwc_album_app/app/pages/home/wigets/sticker_percent.dart';

import '../../core/ui/widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBar(
        backgroundColor: context.colors.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.white,
            onPressed: () async {},
          ),
        ],
      ),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: LayoutBuilder(
            builder: (_, constrains) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constrains.maxHeight,
                  minWidth: constrains.maxWidth,
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 35),
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            'assets/images/bola.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const StickerPercent(percent: 45),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '45 figurinhas',
                          style: context.textStyles.titleWhite,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        StatusTile(
                          icon: Image.asset('assets/images/all_icon.png'),
                          label: 'Todas',
                          value: 34,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        StatusTile(
                          icon: Image.asset('assets/images/missing_icon.png'),
                          label: 'Faltando',
                          value: 500,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        StatusTile(
                          icon: Image.asset('assets/images/repeated_icon.png'),
                          label: 'Repetiadas',
                          value: 30,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Button(
                          onPressed: () {},
                          outline: true,
                          style: context.buttonStyles.yellowOutlinedButton,
                          width: MediaQuery.of(context).size.width * .9,
                          labelStyle:
                              context.textStyles.textSecundaryFontBold.copyWith(
                            color: context.colors.yellow,
                          ),
                          label: 'Minhas Figurinhas',
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
