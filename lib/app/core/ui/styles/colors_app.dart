import 'package:flutter/cupertino.dart';

class ColorsApp {
  static ColorsApp? _instance;
  // Avoid self isntance
  ColorsApp._();
  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xFF791435);
  Color get secundary => const Color(0xFFFDCE50);
  Color get yellow => const Color(0xFFFDCE50);
  Color get grey => const Color(0xFFCCCCCC);
  Color get greyDark => const Color(0xFF999999);
}

extension ColorsAppExtension on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
