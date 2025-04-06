import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// [IconBadge]
///
/// ### 파라미터
/// -[content]: 뱃지 내용
/// -[icon]: 뱃지 아이콘
/// -[backgroundColor]: 뱃지 배경 Color
/// -[textColor]: 텍스트 Color
class IconBadge extends StatelessWidget {
  final String content;
  final String icon;
  final Color backgroundColor;
  final Color textColor;

  const IconBadge({
    super.key,
    required this.content,
    required this.icon,
    required this.textColor,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.0,
      decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(12.0)),
      padding: const EdgeInsets.only(left: 4.0, right: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(icon, height: 16.0, width: 16.0),
          const SizedBox(width: 2.0),
          Text(content, style: MatchTextStyles.Label2.copyWith(color: textColor)),
        ],
      ),
    );
  }
}
