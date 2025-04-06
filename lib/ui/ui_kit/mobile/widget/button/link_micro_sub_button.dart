import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/match_app_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/message/toast_message.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_text_styles.dart';

/// [LinkMicroSubButton]
///
/// ### 파라미터
/// -[title]: 버튼 제목
/// -[assetName]: 버튼 아이콘 에셋 경로
/// -[isEnable]: 버튼 활성화 옵션
/// -[onTap]: 버튼 클릭 이벤트
class LinkMicroSubButton extends StatefulWidget {
  final String title;
  final String? assetName;
  final bool isEnable;
  final FutureOr<void> Function()? onTap;

  const LinkMicroSubButton({
    required this.title,
    this.assetName,
    this.isEnable = true,
    this.onTap,
    super.key,
  });

  @override
  State<LinkMicroSubButton> createState() => _LinkMicroSubButtonState();
}

class _LinkMicroSubButtonState extends State<LinkMicroSubButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 16.0,
      child: InkWell(
        onTap: () async {
          onTabCall()?.call();
          setState(() {
            _isPressed = false;
          });
        },
        onTapCancel: () {
          setState(() {
            _isPressed = false;
          });
        },
        onTapDown: (_) {
          setState(() {
            _isPressed = true;
          });
        },
        splashColor: Colors.transparent, // 물결 효과 제거
        highlightColor: Colors.transparent, // 강조 효과 제거
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            widget.title,
            style: MatchTextStyles.Link2.copyWith(
              color:
                  _isPressed
                      ? MatchAppColors.textColors.textSoft.withOpacity(0.24)
                      : MatchAppColors.textColors.textSoft,
              decorationColor:
                  _isPressed
                      ? MatchAppColors.textColors.textSoft.withOpacity(0.24)
                      : MatchAppColors.textColors.textSoft,
            ),
          ),
        ),
      ),
    );
  }

  GestureTapCallback? onTabCall() {
    if (widget.onTap != null && widget.isEnable) {
      return () async {
        try {
          await widget.onTap?.call();
        } catch (e) {
          ToastMessage.defaultToast(message: '에러 발생: $e');
        }
      };
    } else {
      return null;
    }
  }
}
