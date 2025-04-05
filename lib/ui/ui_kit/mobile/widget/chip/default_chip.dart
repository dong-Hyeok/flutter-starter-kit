import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_chip_styles.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/match_app_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_text_styles.dart';

/// [DefaultChip]
///
/// ### 파라미터
/// -[title]: 칩 타이틀
/// -[assetName]: 칩 아이콘
/// -[assetPosition]: 칩 아이콘 위치
/// -[icActive]: 칩 활성/비활성 스타일 옵션
class DefaultChip extends StatelessWidget {
  final String title;
  final String? assetName;
  final ChipIconPosition assetPosition;
  final bool isActive;

  DefaultChip({
    required this.title,
    this.assetName,
    this.assetPosition = ChipIconPosition.LEFT,
    this.isActive = true,
    super.key,
  });

  final BoxDecoration activeTrue = BoxDecoration(
    color: MatchAppColors.fillColors.fillPrimary,
    borderRadius: BorderRadius.circular(6.0),
  );

  final BoxDecoration activeFalse = BoxDecoration(
    color: MatchAppColors.fillColors.fillDefault_D,
    border: Border.all(color: MatchAppColors.strokeColors.strokeDefault, width: 1.0),
    borderRadius: BorderRadius.circular(6.0),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.0,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: isActive ? activeTrue : activeFalse,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children:
            assetPosition == ChipIconPosition.LEFT
                ? _buildLeftIconLayout()
                : _buildRightIconLayout(),
      ),
    );
  }

  // 아이콘 왼쪽
  List<Widget> _buildLeftIconLayout() {
    return [
      if (assetName != null) ...[
        SvgPicture.asset(assetName!, width: 16, height: 16),
        const SizedBox(width: 4.0),
      ],
      Text(
        title,
        style: MatchTextStyles.Label1.copyWith(
          color:
              isActive
                  ? MatchAppColors.textColors.textInverse_D
                  : MatchAppColors.textColors.textSoft,
        ),
      ),
    ];
  }

  // 아이콘 오른쪽
  List<Widget> _buildRightIconLayout() {
    return [
      Text(
        title,
        style: MatchTextStyles.Label1.copyWith(
          color:
              isActive
                  ? MatchAppColors.textColors.textInverse_D
                  : MatchAppColors.textColors.textSoft,
        ),
      ),
      if (assetName != null) ...[
        const SizedBox(width: 4.0),
        SvgPicture.asset(assetName!, width: 16, height: 16),
      ],
    ];
  }
}
