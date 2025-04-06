import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/asset_path/icon_path.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/match_app_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/badge/default_badge.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/badge/icon_badge.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_badge_styles.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_text_styles.dart';

class DesignSystemBadge extends StatelessWidget {
  const DesignSystemBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Badge")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  'Icon 뱃지',
                  style: MatchTextStyles.Headline2_SemiBold,
                ),
              ),
              IconBadge(
                content: '정상배송',
                icon: IconPath.iconCircleWarning,
                textColor: MatchAppColors.textColors.textGreen,
                backgroundColor: MatchAppColors.fillColors.fillGreenSoft,
              ),
              const SizedBox(height: 32),
              IconBadge(
                content: '대응배송',
                icon: IconPath.iconCircleWarning,
                textColor: MatchAppColors.textColors.textOrange,
                backgroundColor: MatchAppColors.fillColors.fillOrangeSoft,
              ),
              const SizedBox(height: 32),
              IconBadge(
                content: '미배송',
                icon: IconPath.iconCircleWarning,
                textColor: MatchAppColors.textColors.textRed,
                backgroundColor: MatchAppColors.fillColors.fillRedSoft,
              ),
              const SizedBox(height: 32),
              IconBadge(
                content: '프로모션 적용',
                icon: IconPath.iconCircleWarning,
                textColor: MatchAppColors.textColors.textPurple,
                backgroundColor: MatchAppColors.fillColors.fillPurpleSoft,
              ),
              const SizedBox(height: 32),
              IconBadge(
                content: '추가 배송비 적용',
                icon: IconPath.iconCircleWarning,
                textColor: MatchAppColors.textColors.textOrange,
                backgroundColor: MatchAppColors.fillColors.fillOrangeSoft,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 46, bottom: 16),
                child: Text(
                  'Default 뱃지 (Medium)',
                  style: MatchTextStyles.Headline2_SemiBold,
                ),
              ),
              DefaultBadge(
                content: '1박스 11Z01',
                textColor: MatchAppColors.textColors.textDefault,
                backgroundColor: MatchAppColors.fillColors.fillSoft,
              ),
              const SizedBox(height: 32),
              DefaultBadge(
                content: '당일',
                textColor: MatchAppColors.textColors.textInverse,
                backgroundColor: MatchAppColors.fillColors.fillGreen,
              ),
              const SizedBox(height: 32),
              DefaultBadge(
                content: '새벽',
                textColor: MatchAppColors.textColors.textInverse,
                backgroundColor: MatchAppColors.fillColors.fillBlue,
              ),
              const SizedBox(height: 32),
              DefaultBadge(
                content: '2번',
                textColor: MatchAppColors.textColors.textInverse,
                backgroundColor: MatchAppColors.fillColors.fillStrong,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 46, bottom: 16),
                child: Text(
                  'Default 뱃지 (Small)',
                  style: MatchTextStyles.Headline2_SemiBold,
                ),
              ),
              DefaultBadge(
                content: '미입력',
                textColor: MatchAppColors.textColors.textRed,
                backgroundColor: MatchAppColors.fillColors.fillRedSoft,
                defaultBadgeStyle: DefaultBadgeStyle.Small,
              ),
              const SizedBox(height: 32),
              DefaultBadge(
                content: '1-1',
                textColor: MatchAppColors.textColors.textPrimary,
                backgroundColor: MatchAppColors.fillColors.fillDisabled,
                defaultBadgeStyle: DefaultBadgeStyle.Small,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
