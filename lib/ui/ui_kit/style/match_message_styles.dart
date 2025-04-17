import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/asset_path/icon_path.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/app_colors.dart';

enum MatchMessageStyles { ERROR, HELPER, CHECK, TOOLTIP }

class MatchMessageStyleConfig {
  final String icon;
  final Color iconColor;
  final Color textColor;

  MatchMessageStyleConfig({required this.icon, required this.iconColor, required this.textColor});

  factory MatchMessageStyleConfig.from(MatchMessageStyles style) {
    switch (style) {
      case MatchMessageStyles.ERROR:
        return MatchMessageStyleConfig(
          icon: IconPath.iconTriangleWarning,
          iconColor: AppColors.iconColors.iconError,
          textColor: AppColors.textColors.textError,
        );
      case MatchMessageStyles.HELPER:
        return MatchMessageStyleConfig(
          icon: IconPath.iconCircleWarning,
          iconColor: AppColors.iconColors.iconSoft,
          textColor: AppColors.textColors.textHelper,
        );
      case MatchMessageStyles.CHECK:
        return MatchMessageStyleConfig(
          icon: IconPath.iconCheck,
          iconColor: AppColors.iconColors.iconDisabled,
          textColor: AppColors.textColors.textHelper,
        );
      case MatchMessageStyles.TOOLTIP:
        return MatchMessageStyleConfig(
          icon: IconPath.iconCircleQuestion,
          iconColor: AppColors.iconColors.iconSoft,
          textColor: AppColors.textColors.textHelper,
        );
    }
  }
}
