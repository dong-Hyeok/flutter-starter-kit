import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/asset_path/icon_path.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/app_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/badge/default_badge.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/badge/icon_badge.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_badge_styles.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/text_styles.dart';

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
                  style: TextStyles.Headline2_SemiBold,
                ),
              ),
              IconBadge(
                content: '정상배송',
                icon: IconPath.iconCircleWarning,
                textColor: AppColors.textColors.textGreen,
                backgroundColor: AppColors.fillColors.fillGreenSoft,
              ),
              const SizedBox(height: 32),
              IconBadge(
                content: '대응배송',
                icon: IconPath.iconCircleWarning,
                textColor: AppColors.textColors.textOrange,
                backgroundColor: AppColors.fillColors.fillOrangeSoft,
              ),
              const SizedBox(height: 32),
              IconBadge(
                content: '미배송',
                icon: IconPath.iconCircleWarning,
                textColor: AppColors.textColors.textRed,
                backgroundColor: AppColors.fillColors.fillRedSoft,
              ),
              const SizedBox(height: 32),
              IconBadge(
                content: '프로모션 적용',
                icon: IconPath.iconCircleWarning,
                textColor: AppColors.textColors.textPurple,
                backgroundColor: AppColors.fillColors.fillPurpleSoft,
              ),
              const SizedBox(height: 32),
              IconBadge(
                content: '추가 배송비 적용',
                icon: IconPath.iconCircleWarning,
                textColor: AppColors.textColors.textOrange,
                backgroundColor: AppColors.fillColors.fillOrangeSoft,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 46, bottom: 16),
                child: Text(
                  'Default 뱃지 (Medium)',
                  style: TextStyles.Headline2_SemiBold,
                ),
              ),
              DefaultBadge(
                content: '1박스 11Z01',
                textColor: AppColors.textColors.textDefault,
                backgroundColor: AppColors.fillColors.fillSoft,
              ),
              const SizedBox(height: 32),
              DefaultBadge(
                content: '당일',
                textColor: AppColors.textColors.textInverse,
                backgroundColor: AppColors.fillColors.fillGreen,
              ),
              const SizedBox(height: 32),
              DefaultBadge(
                content: '새벽',
                textColor: AppColors.textColors.textInverse,
                backgroundColor: AppColors.fillColors.fillBlue,
              ),
              const SizedBox(height: 32),
              DefaultBadge(
                content: '2번',
                textColor: AppColors.textColors.textInverse,
                backgroundColor: AppColors.fillColors.fillStrong,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 46, bottom: 16),
                child: Text(
                  'Default 뱃지 (Small)',
                  style: TextStyles.Headline2_SemiBold,
                ),
              ),
              DefaultBadge(
                content: '미입력',
                textColor: AppColors.textColors.textRed,
                backgroundColor: AppColors.fillColors.fillRedSoft,
                defaultBadgeStyle: DefaultBadgeStyle.Small,
              ),
              const SizedBox(height: 32),
              DefaultBadge(
                content: '1-1',
                textColor: AppColors.textColors.textPrimary,
                backgroundColor: AppColors.fillColors.fillDisabled,
                defaultBadgeStyle: DefaultBadgeStyle.Small,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
