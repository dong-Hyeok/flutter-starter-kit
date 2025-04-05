import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/match_app_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/message/toast_message.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_button_styles.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_text_styles.dart';

/// [LinkMediumSecondaryButton]
///
/// ### 파라미터
/// -[title]: 버튼 제목
/// -[assetName]: 버튼 아이콘 에셋 경로
/// -[assetPosition]: 아이콘 위치 옵션
/// -[widthOption]: 버튼 넓이 옵션
/// -[isEnable]: 버튼 활성화 옵션
/// -[onTap]: 버튼 클릭 이벤트
class LinkMediumSecondaryButton extends StatefulWidget {
  final String title;
  final String? assetName;
  final ButtonIconPosition assetPosition;
  final ButtonWidthOption widthOption;
  final bool isEnable;
  final FutureOr<void> Function()? onTap;

  const LinkMediumSecondaryButton({
    required this.title,
    this.assetName,
    this.assetPosition = ButtonIconPosition.LEFT,
    this.widthOption = ButtonWidthOption.WRAP,
    this.isEnable = true,
    this.onTap,
    super.key,
  });

  @override
  State<LinkMediumSecondaryButton> createState() => _LinkMediumSecondaryButtonState();
}

class _LinkMediumSecondaryButtonState extends State<LinkMediumSecondaryButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 28.0,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize:
                widget.widthOption == ButtonWidthOption.WRAP ? MainAxisSize.min : MainAxisSize.max,
            children:
                widget.assetPosition == ButtonIconPosition.LEFT
                    ? _buildLeftIconLayout()
                    : _buildRightIconLayout(),
          ),
        ),
      ),
    );
  }

  // 아이콘 왼쪽
  List<Widget> _buildLeftIconLayout() {
    return [
      if (widget.assetName != null) ...[
        SvgPicture.asset(widget.assetName!, width: 16, height: 16),
        const SizedBox(width: 4.0),
      ],
      Text(
        widget.title,
        style: MatchTextStyles.Link1.copyWith(
          color:
              _isPressed
                  ? MatchAppColors.textColors.textSoft.withOpacity(0.7)
                  : MatchAppColors.textColors.textSoft,
        ),
      ),
    ];
  }

  // 아이콘 오른쪽
  List<Widget> _buildRightIconLayout() {
    return [
      Text(
        widget.title,
        style: MatchTextStyles.Link1.copyWith(
          color:
              _isPressed
                  ? MatchAppColors.textColors.textSoft.withOpacity(0.24)
                  : MatchAppColors.textColors.textSoft,
        ),
      ),
      if (widget.assetName != null) ...[
        const SizedBox(width: 4.0),
        SvgPicture.asset(widget.assetName!, width: 16, height: 16),
      ],
    ];
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
