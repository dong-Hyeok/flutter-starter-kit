import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/asset_path/icon_path.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/app_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ToastMessage {
  /// [defaultToast]
  ///
  /// ### 파라미터
  /// -[message]: 메시지 내용
  /// -[milliseconds]: 메시지 유지 시간
  /// -[backgroundColor]: 메시지 배경 Color
  /// -[position]: 메시지 위치
  /// -[onButtonPressed]: 메시지 우측 버튼 클릭 이벤트
  static void defaultToast({
    required String message,
    int milliseconds = 2000,
    Color? backgroundColor,
    SnackPosition position = SnackPosition.BOTTOM,
    VoidCallback? onButtonPressed,
  }) {
    Get.rawSnackbar(
      messageText: Text(
        message,
        style: TextStyles.Body1_Regular.copyWith(
          color: AppColors.textColors.textInverse_D,
        ),
      ),
      snackPosition: position,
      duration: Duration(milliseconds: milliseconds),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      borderRadius: 8,
      snackStyle: SnackStyle.FLOATING,
      backgroundColor:
          backgroundColor ?? AppColors.interactionColors.interactionTransparentDark,
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.decelerate,
      mainButton:
          onButtonPressed != null
              ? IconButton(
                onPressed: onButtonPressed,
                icon: SvgPicture.asset(
                  IconPath.iconArrowRight,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    AppColors.iconColors.iconInverse_D,
                    BlendMode.srcIn,
                  ),
                ),
              )
              : null,
    );
  }
}
