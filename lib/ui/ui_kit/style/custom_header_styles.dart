import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/app_colors.dart';

class CustomAppbarStyles {
  final SystemUiOverlayStyle systemOverlayStyle;
  final Color backgroundColor;
  final ColorFilter iconColor;
  final Color textColor;

  CustomAppbarStyles({
    required this.systemOverlayStyle,
    required this.backgroundColor,
    required this.iconColor,
    required this.textColor,
  });

  factory CustomAppbarStyles.from(bool isBackground) {
    return CustomAppbarStyles(
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
