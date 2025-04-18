import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/message/toast_message.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/custom_chip_styles.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/app_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/text_styles.dart';

/// [SmallChip]
///
/// ### 파라미터
/// -[title]: 칩 타이틀
/// -[assetName]: 칩 아이콘
/// -[assetPosition]: 칩 아이콘 위치
/// -[onIconTap]: 아이콘 클릭 이벤트
class SmallChip extends StatelessWidget {
  final String title;
  final String? assetName;
  final ChipIconPosition assetPosition;
  final FutureOr<void> Function()? onIconTap;

  const SmallChip({
    required this.title,
    this.assetName,
    this.assetPosition = ChipIconPosition.RIGHT,
    this.onIconTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.0,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.fillColors.fillSoft_D,
        borderRadius: BorderRadius.circular(6.0),
      ),
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
      if (assetName != null) ...[iconWidget(), const SizedBox(width: 4.0)],
      titleWidget(),
    ];
  }

  // 아이콘 오른쪽
  List<Widget> _buildRightIconLayout() {
    return [
      titleWidget(),
      if (assetName != null) ...[const SizedBox(width: 4.0), iconWidget()],
    ];
  }

  Text titleWidget() {
    return Text(
      title,
      style: TextStyles.Label1.copyWith(color: AppColors.textColors.textSoft),
    );
  }

  GestureDetector iconWidget() {
    return GestureDetector(
      onTap: onTabCall(),
      child: SvgPicture.asset(
        assetName!,
        width: 16,
        height: 16,
        colorFilter: ColorFilter.mode(AppColors.iconColors.iconDefault, BlendMode.srcIn),
      ),
    );
  }

  GestureTapCallback? onTabCall() {
    if (onIconTap != null) {
      return () async {
        try {
          await onIconTap?.call();
        } catch (e) {
          ToastMessage.defaultToast(message: '에러 발생: $e');
        }
      };
    } else {
      return null;
    }
  }
}
