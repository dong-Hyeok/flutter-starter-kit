import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:timf_match/design_system/color/match_app_colors.dart';
import 'package:timf_match/design_system/style/match_text_styles.dart';
import 'package:timf_match/resources/images.dart';

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
        style: MatchTextStyles.Body1_Regular.copyWith(color: MatchAppColors.textColors.textInverse_D),
      ),
      snackPosition: position,
      duration: Duration(milliseconds: milliseconds),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      borderRadius: 8,
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: backgroundColor ?? MatchAppColors.interactionColors.interactionTransparentDark,
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.decelerate,
      mainButton: onButtonPressed != null
          ? IconButton(
              onPressed: onButtonPressed,
              icon: SvgPicture.asset(
                AppImages.arrowRight,
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(
                  MatchAppColors.iconColors.iconInverse_D,
                  BlendMode.srcIn,
                ),
              ),
            )
          : null,
    );
  }
}
