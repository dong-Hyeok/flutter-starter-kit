import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/app_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/message/toast_message.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/custom_button_styles.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/text_styles.dart';

/// [MicroColorButton]
///
/// ### 파라미터
/// -[title]: 버튼 제목
/// -[assetName]: 버튼 아이콘 에셋 경로
/// -[assetPosition]: 아이콘 위치 옵션
/// -[widthOption]: 버튼 넓이 옵션
/// -[backgroundColor]: 버튼 배경 색
/// -[onTap]: 버튼 클릭 이벤트
class MicroColorButton extends StatelessWidget {
  final String title;
  final String? assetName;
  final ButtonIconPosition assetPosition;
  final ButtonWidthOption widthOption;
  final double? customWidth;
  final Color? backgroundColor;
  final FutureOr<void> Function()? onTap;

  const MicroColorButton({
    required this.title,
    this.assetName,
    this.assetPosition = ButtonIconPosition.LEFT,
    this.widthOption = ButtonWidthOption.WRAP,
    this.backgroundColor,
    this.customWidth,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 28.0,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.fillColors.fillPrimary,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: InkWell(
        onTap: onTabCall(),
        borderRadius: BorderRadius.circular(4.0),
        splashColor: AppColors.interactionColors.interactionPressedInverse,
        highlightColor: AppColors.interactionColors.interactionPressedInverse,
        child: Container(
          width: _getWidth(),
          padding: _getPadding(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children:
                assetPosition == ButtonIconPosition.LEFT
                    ? _buildLeftIconLayout()
                    : _buildRightIconLayout(),
          ),
        ),
      ),
    );
  }

  double? _getWidth() {
    switch (widthOption) {
      case ButtonWidthOption.FULL:
        return double.infinity;
      case ButtonWidthOption.CUSTOM:
        return customWidth;
      case ButtonWidthOption.WRAP:
    }

    return null;
  }

  EdgeInsets _getPadding() {
    if (widthOption == ButtonWidthOption.CUSTOM) {
      return EdgeInsets.zero;
    } else {
      return const EdgeInsets.symmetric(horizontal: 20);
    }
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
        style: TextStyles.Button1.copyWith(color: AppColors.textColors.textInverse),
      ),
    ];
  }

  // 아이콘 오른쪽
  List<Widget> _buildRightIconLayout() {
    return [
      Text(
        title,
        style: TextStyles.Button1.copyWith(color: AppColors.textColors.textInverse),
      ),
      if (assetName != null) ...[
        const SizedBox(width: 4.0),
        SvgPicture.asset(assetName!, width: 16, height: 16),
      ],
    ];
  }

  GestureTapCallback? onTabCall() {
    if (onTap != null) {
      return () async {
        try {
          await onTap?.call();
        } catch (e) {
          ToastMessage.defaultToast(message: '에러 발생: $e');
        }
      };
    } else {
      return null;
    }
  }
}
