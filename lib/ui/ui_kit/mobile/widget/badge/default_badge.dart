import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_badge_styles.dart';

/// [DefaultBadge]
///
/// ### 파라미터
/// -[content]: 뱃지 내용
/// -[backgroundColor]: 뱃지 배경 Color
/// -[textColor]: 텍스트 Color
/// -[defaultBadgeStyle]: 뱃지 스타일
class DefaultBadge extends StatelessWidget {
  final String content;
  final Color backgroundColor;
  final Color textColor;
  final DefaultBadgeStyle defaultBadgeStyle;

  const DefaultBadge({
    super.key,
    required this.content,
    required this.textColor,
    this.backgroundColor = Colors.transparent,
    this.defaultBadgeStyle = DefaultBadgeStyle.Medium,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: defaultBadgeStyle.height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: defaultBadgeStyle.paddingHorizontal,
        ),
        alignment: Alignment.center,
        child: Text(
          content,
          style: defaultBadgeStyle.textStyle.copyWith(color: textColor),
        ),
      ),
    );
  }
}
