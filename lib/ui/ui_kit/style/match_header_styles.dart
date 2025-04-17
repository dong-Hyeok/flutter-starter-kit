import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/app_colors.dart';

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
      backgroundColor: isBackground ? AppColors.fillColors.fillPrimary_D : Colors.transparent,
      iconColor: ColorFilter.mode(
        isBackground
            ? AppColors.iconColors.iconInverse_D : AppColors.iconColors.iconDefault,
        BlendMode.srcIn,
      ),
      textColor:
          isBackground
              ? AppColors.textColors.textInverse_D : AppColors.textColors.textStrong,
    );
  }
}
