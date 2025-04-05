import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:timf_match/design_system/color/match_app_colors.dart';

// TODO 나중에 지워야함 (사용 안할거임)
class DefaultToolTip extends StatelessWidget {
  final String tooltipText;
  final Widget childWidget;

  const DefaultToolTip({
    super.key,
    required this.tooltipText,
    required this.childWidget,
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
      child: SuperTooltip(
        controller: tooltipController,
        content: Text(
          tooltipText,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: MatchAppColors.interactionColors.interactionTransparentDark,
        hasShadow: true,
        shadowColor: Colors.transparent,
        arrowTipDistance: 8.0,
        arrowBaseWidth: 12.0,
        arrowLength: 6.0,
        left: 80,
        borderRadius: 4.0,
        showBarrier: true,
        barrierColor: Colors.transparent,
        popupDirection: TooltipDirection.down,
        child: childWidget,
      ),
    );
  }
}
