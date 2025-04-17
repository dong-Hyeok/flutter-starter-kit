import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/asset_path/icon_path.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/app_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/component/header_components/match_header.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/divider/divider.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/tooltip/match_custom_tooltip.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/text_styles.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_tooltip_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DesignSystemTooltip extends StatelessWidget {
  const DesignSystemTooltip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MatchAppbar(
        title: "Tooltip",
        onRightIconPressed: () {},
        isBackground: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '현재 Center Top, Center Bottom 만 구현된 상태\n',
                style: TextStyles.Body1_Medium,
              ),
              topBorderDivider(),
              const SizedBox(height: 30),
              MatchCustomTooltip(
                tooltipText: "툴팁 등장이요~",
                matchTooltipStyles: MatchTooltipStyles.CENTER_BOTTOM,
                iconWidget: tooltipIcon(),
                subWidget: tooltipSubWidget('1.커스텀 툴팁(Center Bottom)'),
              ),
              const SizedBox(height: 60),
              MatchCustomTooltip(
                tooltipText: "툴팁 등장이요~",
                matchTooltipStyles: MatchTooltipStyles.CENTER_TOP,
                iconWidget: tooltipIcon(),
                subWidget: tooltipSubWidget('2.커스텀 툴팁(Center Top)'),
              ),
              const SizedBox(height: 100),
              const Text(
                '이건 수퍼 툴팁 라이브러리 사용한 예시(사용하지 않을 예정)',
                style: TextStyles.Body1_Medium,
              ),
              topBorderDivider(),
              const SizedBox(height: 30),
              // MatchSuperToolt(
              //   tooltipText: '툴팁 등장!!!!!!!!!',
              //   iconWidget: tooltipIcon(),
              //   subWidget: tooltipSubWidget('3.커스텀 수퍼 툴팁'),
              // )
            ],
          ),
        ),
      ),
    );
  }

  SvgPicture tooltipIcon() {
    return SvgPicture.asset(
      IconPath.iconCircleQuestion,
      height: 16,
      width: 16,
    );
  }

  Widget tooltipSubWidget(String title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyles.Body1_Medium.copyWith(
              color: AppColors.textColors.textStrong),
        ),
        const SizedBox(width: 2),
      ],
    );
  }

  Widget tooltipChildWidget(String title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyles.Body1_Medium.copyWith(
              color: AppColors.textColors.textStrong),
        ),
        const SizedBox(width: 2),
        SvgPicture.asset(
          IconPath.iconCircleQuestion,
          height: 16,
          width: 16,
        ),
      ],
    );
  }
}
