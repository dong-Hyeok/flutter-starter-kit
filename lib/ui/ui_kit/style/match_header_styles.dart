import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/match_app_colors.dart';

class MatchHeaderStyles {
  final SystemUiOverlayStyle systemOverlayStyle;
  final Color backgroundColor;
  final ColorFilter iconColor;
  final Color textColor;

  MatchHeaderStyles({
    required this.systemOverlayStyle,
    required this.backgroundColor,
    required this.iconColor,
    required this.textColor,
  });

  factory MatchHeaderStyles.from(bool isBackground) {
    return MatchHeaderStyles(
      systemOverlayStyle: isBackground ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      backgroundColor: isBackground ? MatchAppColors.fillColors.fillPrimary_D : Colors.transparent,
      iconColor: ColorFilter.mode(
        isBackground ? MatchAppColors.iconColors.iconInverse_D : MatchAppColors.iconColors.iconDefault,
        BlendMode.srcIn,
      ),
      textColor: isBackground ? MatchAppColors.textColors.textInverse_D : MatchAppColors.textColors.textStrong,
    );
  }
}
