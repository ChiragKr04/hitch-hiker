import 'package:flutter/material.dart';
import 'package:hitch_hiker_app/constants/constant_colors.dart';
import 'package:hitch_hiker_app/constants/constant_font_style.dart';

class LogoText extends StatelessWidget {
  const LogoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Hitch Hiker",
      style: TextStyle(
        fontFamily: ConstantFontStyle.billabong,
        fontSize: 40,
        color: ConstantColors.white,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}
