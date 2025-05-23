import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/custom_message_styles.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// [SupportingMessage]
///
/// ### 파라미터
/// -[text]: 메시지 내용
/// -[messageStyles]: 메시지 스타일
class SupportingMessage extends StatelessWidget {
  final String text;
  final CustomMessageStyles messageStyles;

  const SupportingMessage({required this.text, required this.messageStyles, super.key});

  @override
  Widget build(BuildContext context) {
    final styleConfig = CustomMessageStyleConfig.from(messageStyles);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          styleConfig.icon,
          height: 16,
          width: 16,
          colorFilter: ColorFilter.mode(styleConfig.iconColor, BlendMode.srcIn),
        ),
        const SizedBox(width: 2.0),
        Expanded(
          child: Text(text, style: TextStyles.Caption1.copyWith(color: styleConfig.textColor)),
        ),
      ],
    );
  }
}
