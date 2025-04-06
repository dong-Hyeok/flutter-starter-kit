import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/match_app_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/large_primary_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/large_secondary_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_button_styles.dart';
import 'package:get/get.dart';

/// [MatchDefaltDialog]
///
/// - [title]: 모달 타이틀
/// - [body]: 모달 바디(String)
/// - [leftButtonTitle]: 왼쪽 버튼 타이틀
/// - [rightButtonTitle]: 오른쪽 버튼 타이틀
/// - [onClickLeft]: 왼쪽 버튼 클릭 콜백 메서드
/// - [onClickRight]: 오른쪽 버튼 클릭 콜백 메서드
///
/// [왼쪽 버튼 타이틀이 없으면 사용하지 않는 것으로 취급]
class MatchCustomModal extends StatelessWidget {
  final Widget bodyWidget;
  final String? leftButtonTitle;
  final String rightButtonTitle;
  final VoidCallback? onClickLeft;
  final VoidCallback? onClickRight;

  const MatchCustomModal({
    required this.bodyWidget,
    this.leftButtonTitle,
    required this.rightButtonTitle,
    this.onClickLeft,
    this.onClickRight,
    super.key,
  });

  /// [다이얼로그 호출 메서드임!!!!]
  /// - [isBarrierDismissible]: 다이얼로그 외부 클릭시 다이얼로그 close 여부
  static void show({
    required Widget bodyWidget,
    String? leftButtonTitle,
    required String rightButtonTitle,
    VoidCallback? onClickLeft,
    VoidCallback? onClickRight,
    bool isBarrierDismissible = false,
  }) {
    Get.dialog(
      MatchCustomModal(
        bodyWidget: bodyWidget,
        leftButtonTitle: leftButtonTitle,
        rightButtonTitle: rightButtonTitle,
        onClickLeft: onClickLeft ?? () => Get.back(),
        onClickRight: onClickRight ?? () => Get.back(),
      ),
      barrierDismissible: isBarrierDismissible, // 바깥 클릭 방지
      barrierColor: Colors.black.withOpacity(0.5), // 배경 어둡게
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: MatchAppColors.fillColors.fillDefault_D,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          padding: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0, bottom: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: const EdgeInsets.only(left: 8.0, right: 8.0), child: bodyWidget),
              _actionWidget(),
            ],
          ),
        ),
      ),
    );
  }

  // 하단 버튼
  Row _actionWidget() {
    return Row(
      children: [
        if (leftButtonTitle != null)
          Expanded(
            child: LargeSecondaryButton(
              title: leftButtonTitle!,
              onTap: onClickLeft,
              widthOption: ButtonWidthOption.FULL,
            ),
          ),
        if (leftButtonTitle != null) const SizedBox(width: 8.0),
        Expanded(
          child: LargePrimaryButton(title: rightButtonTitle, onTap: onClickRight, widthOption: ButtonWidthOption.FULL),
        ),
      ],
    );
  }
}
