import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:timf_match/design_system/color/match_app_colors.dart';
import 'package:timf_match/design_system/style/match_text_styles.dart';

class MatchSuperTooltip extends StatelessWidget {
  final String tooltipText;
  final String? tooltipIcon;
  final Widget iconWidget;
  final Widget? subWidget;

  const MatchSuperTooltip({
    super.key,
    required this.tooltipText,
    this.tooltipIcon,
    required this.iconWidget,
    this.subWidget,
  });

  @override
  Widget build(BuildContext context) {
    final SuperTooltipController tooltipController = SuperTooltipController();

    return GestureDetector(
      onTap: () {
        if (tooltipController.isVisible) {
          tooltipController.hideTooltip();
        } else {
          tooltipController.showTooltip();
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (subWidget != null) ...{
            subWidget!,
          },
          SuperTooltip(
            controller: tooltipController,
            content: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  tooltipText,
                  style: MatchTextStyles.Body3_Regular.copyWith(
                    color: MatchAppColors.textColors.textInverse,
                  ),
                ),
                if (tooltipIcon != null) ...{
                  SvgPicture.asset(tooltipIcon!),
                },
              ],
            ),
            backgroundColor: MatchAppColors.interactionColors.interactionTransparentDark,
            hasShadow: true,
            shadowColor: Colors.transparent,
            arrowTipDistance: 8.0,
            arrowBaseWidth: 12.0,
            arrowLength: 6.0,
            borderRadius: 4.0,
            showBarrier: true,
            barrierColor: Colors.transparent,
            popupDirection: TooltipDirection.down,
            child: iconWidget,
          ),
        ],
      ),
    );
  }
}
