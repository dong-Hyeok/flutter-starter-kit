import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/asset_path/icon_path.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/app_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/large_primary_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/large_secondary_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_button_styles.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

/// [MatchBottomSheet]
///
/// ### 파라미터
/// -[title]: 바텀시트 상단 타이틀
/// -[bodyWidget]: 바텀시트 바디 위젯
/// -[leftButtonTitle]: 바텀시트 하단 좌측 버튼 타이틀
/// -[rightButtonTitle]: 바텀시트 하단 우측 버튼 타이틀
/// -[onClickLeft]: 바텀시트 하단 좌측버튼 클릭 이벤트 콜백
/// -[onClickRight]: 바텀시트 하단 우측버튼 클릭 이벤트 콜백
/// -[onClickTitleIcon]: 바텀시트 타이틀 우측 아이콘 클릭 이벤트 콜백
/// -[isHorizontalPadding]: 바텀시트 좌우 패딩 값 on/off
/// -[isBarrierDismissible]: 외부 클릭시 바텀시트 종료 옵션(Default: true(외부 클릭시 바텀시트 사라짐))
class MatchBottomSheet extends StatelessWidget {
  final String? title;
  final Widget bodyWidget;
  final String? leftButtonTitle;
  final String? rightButtonTitle;
  final VoidCallback? onClickLeft;
  final VoidCallback? onClickRight;
  final VoidCallback? onClickTitleIcon;
  final bool isHorizontalPadding;

  const MatchBottomSheet({
    this.title,
    required this.bodyWidget,
    this.leftButtonTitle,
    this.rightButtonTitle,
    this.onClickLeft,
    this.onClickRight,
    this.onClickTitleIcon,
    required this.isHorizontalPadding,
    super.key,
  });

  static void show({
    String? title,
    required Widget bodyWidget,
    String? leftButtonTitle,
    String? rightButtonTitle,
    VoidCallback? onClickLeft,
    VoidCallback? onClickRight,
    VoidCallback? onClickTitleIcon,
    bool isisHorizontalPadding = true,
    bool isBarrierDismissible = true,
  }) {
    Get.bottomSheet(
      MatchBottomSheet(
        title: title,
        bodyWidget: bodyWidget,
        leftButtonTitle: leftButtonTitle,
        rightButtonTitle: rightButtonTitle,
        onClickLeft: onClickLeft ?? () => Get.back(),
        onClickRight: onClickRight ?? () => Get.back(),
        onClickTitleIcon: onClickTitleIcon,
        isHorizontalPadding: isisHorizontalPadding,
      ),
      isDismissible: isBarrierDismissible,
      isScrollControlled: true,
      backgroundColor: AppColors.fillColors.fillDefault_D,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min, // 내부 높이에 맞게 높이 지정
        children: [
          // 상단
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _dragHandle(),
              _titleWidget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isHorizontalPadding ? 16.0 : 0),
                child: bodyWidget,
              ),
            ],
          ),
          // 하단
          Column(
            children: [
              _actionWidget(),
              if (Platform.isAndroid) ...{_androidBottomHandle()} else ...{_iOSBottomHandle()},
            ],
          ),
        ],
      ),
    );
  }

  // 타이틀이 없으면 아이콘 사용 불가!
  Widget _titleWidget() {
    if (title != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            // 타이틀
            Text(
              title!,
              style: TextStyles.Title.copyWith(color: AppColors.textColors.textStrong),
            ),
            // 타이틀 아이콘
            if (onClickTitleIcon != null) ...{
              const SizedBox(width: 2),
              GestureDetector(
                onTap: onClickTitleIcon,
                child: SvgPicture.asset(IconPath.iconCircleQuestion, height: 16, width: 16),
              ),
            },
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _dragHandle() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: Center(
        child: Container(
          width: 40,
          height: 6,
          decoration: BoxDecoration(
            color: AppColors.iconColors.iconDisabledSoft,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }

  Widget _androidBottomHandle() {
    return Container(
      width: double.infinity,
      height: 20,
      padding: const EdgeInsets.only(top: 27.0, bottom: 8.0),
    );
  }

  Widget _iOSBottomHandle() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 27.0, bottom: 8.0),
      child: Center(
        child: Container(
          width: 134,
          height: 5,
          decoration: BoxDecoration(
            color: AppColors.fillColors.fillStrong,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }

  // 하단 버튼
  Widget _actionWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 16.0, right: 16.0),
      child: Row(
        children: [
          if (leftButtonTitle != null) ...{
            Expanded(
              child: LargeSecondaryButton(
                title: leftButtonTitle!,
                onTap: onClickLeft,
                widthOption: ButtonWidthOption.FULL,
              ),
            ),
            const SizedBox(width: 8.0),
          },
          if (rightButtonTitle != null) ...{
            Expanded(
              child: LargePrimaryButton(
                title: rightButtonTitle!,
                onTap: onClickRight,
                widthOption: ButtonWidthOption.FULL,
              ),
            ),
          },
        ],
      ),
    );
  }
}
