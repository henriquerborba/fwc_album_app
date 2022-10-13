import 'package:flutter/material.dart';

import '../styles/colors_app.dart';

class RoudedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const RoudedButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      shadowColor: Colors.grey.withOpacity(0.2),
      shape: const CircleBorder(),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: context.colors.greyDark,
          ),
        ),
      ),
    );
  }
}
