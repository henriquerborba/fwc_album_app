import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with Loader {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_splash.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08,
                ),
                child: Image.asset(
                  'assets/images/fifa_logo.png',
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.19,
                ),
                child: Button(
                  width: MediaQuery.of(context).size.width * 0.9,
                  onPressed: () {},
                  style: context.buttonStyles.yellowButton,
                  labelStyle:
                      context.textStyles.textSecundadryFontExtraBolPrimaryColor,
                  label: 'Acessar',
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Image.asset('assets/images/bandeiras.png')),
            )
          ],
        ),
      ),
    );
  }
}
