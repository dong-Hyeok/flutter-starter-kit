import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/asset_path/icon_path.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/app_colors.dart';

enum CustomMessageStyles { ERROR, HELPER, CHECK, TOOLTIP }

class CustomMessageStyleConfig {
  final String icon;
  final Color iconColor;
  final Color textColor;

  CustomMessageStyleConfig({required this.icon, required this.iconColor, required this.textColor});

  factory CustomMessageStyleConfig.from(CustomMessageStyles style) {
    switch (style) {
      case CustomMessageStyles.ERROR:
        return CustomMessageStyleConfig(
          icon: IconPath.iconTriangleWarning,
          iconColor: AppColors.iconColors.iconError,
          textColor: AppColors.textColors.textError,
        );
      case CustomMessageStyles.HELPER:
        return CustomMessageStyleConfig(
          icon: IconPath.iconCircleWarning,
          iconColor: AppColors.iconColors.iconSoft,
          textColor: AppColors.textColors.textHelper,
        );
      case CustomMessageStyles.CHECK:
        return CustomMessageStyleConfig(
          icon: IconPath.iconCheck,
          iconColor: AppColors.iconColors.iconDisabled,
          textColor: AppColors.textColors.textHelper,
        );
      case CustomMessageStyles.TOOLTIP:
        return CustomMessageStyleConfig(
          icon: IconPath.iconCircleQuestion,
          iconColor: AppColors.iconColors.iconSoft,
          textColor: AppColors.textColors.textHelper,
        );
    }
  }
}
