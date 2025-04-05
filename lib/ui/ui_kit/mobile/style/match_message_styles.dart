import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/match_app_colors.dart';

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
          icon: AppImages.iconTriangleWarning,
          iconColor: MatchAppColors.iconColors.iconError,
          textColor: MatchAppColors.textColors.textError,
        );
      case MatchMessageStyles.HELPER:
        return MatchMessageStyleConfig(
          icon: AppImages.circleWarning,
          iconColor: MatchAppColors.iconColors.iconSoft,
          textColor: MatchAppColors.textColors.textHelper,
        );
      case MatchMessageStyles.CHECK:
        return MatchMessageStyleConfig(
          icon: AppImages.iconCheck,
          iconColor: MatchAppColors.iconColors.iconDisabled,
          textColor: MatchAppColors.textColors.textHelper,
        );
      case MatchMessageStyles.TOOLTIP:
        return MatchMessageStyleConfig(
          icon: AppImages.circleQuestion,
          iconColor: MatchAppColors.iconColors.iconSoft,
          textColor: MatchAppColors.textColors.textHelper,
        );
      default:
        return MatchMessageStyleConfig(
          icon: AppImages.circleQuestion,
          iconColor: MatchAppColors.iconColors.iconSoft,
          textColor: MatchAppColors.textColors.textHelper,
        );
    }
  }
}
