import 'package:flutter/material.dart';

import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/pages/home/presenter/home_presenter.dart';
import 'package:fwc_album_app/app/pages/home/view/home_view_impl.dart';
import 'package:fwc_album_app/app/pages/home/wigets/status_tile.dart';
import 'package:fwc_album_app/app/pages/home/wigets/sticker_percent.dart';

import '../../core/ui/widgets/button.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;

  const HomePage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomeViewImpl {
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
            onPressed: () {
              widget.presenter.logout();
            },
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
                        StickerPercent(
                            percent: user?.totalCompletePercent ?? 0),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${user?.totalStickers ?? 0} figurinhas',
                          style: context.textStyles.titleWhite,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        StatusTile(
                          icon: Image.asset('assets/images/all_icon.png'),
                          label: 'Todas',
                          value: user?.totalAlbum ?? 0,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        StatusTile(
                          icon: Image.asset('assets/images/missing_icon.png'),
                          label: 'Faltando',
                          value: user?.totalComplete ?? 0,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        StatusTile(
                          icon: Image.asset('assets/images/repeated_icon.png'),
                          label: 'Repetiadas',
                          value: user?.totalDuplicates ?? 0,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Button(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/my-stickers');
                          },
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
