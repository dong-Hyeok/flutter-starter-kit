import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/logger/app_logger';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/component/header_components/match_header.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/large_primary_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/message/supporting_message.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/message/toast_message.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_button_styles.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_message_styles.dart';


class DesignSystemMessage extends StatelessWidget {
  const DesignSystemMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MatchAppbar(
        title: "Message",
        onRightIconPressed: () {},
        isBackground: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SupportingMessage(
                text: '도움말', messageStyles: MatchMessageStyles.ERROR),
            const SupportingMessage(
                text: '도움말', messageStyles: MatchMessageStyles.HELPER),
            const SupportingMessage(
                text: '도움말', messageStyles: MatchMessageStyles.CHECK),
            const SupportingMessage(
                text: '도움말', messageStyles: MatchMessageStyles.TOOLTIP),
            const SizedBox(height: 60),
            LargePrimaryButton(
              title: '클릭이벤트 있는 토스트 메시지',
              widthOption: ButtonWidthOption.FULL,
              onTap: () {
                ToastMessage.defaultToast(
                    message: '토스트 메시지 출력',
                    onButtonPressed: () {
                      LoggerService.logDebug('[1] 토스트 메시지 클릭 이벤트 발생');
                    });
              },
            ),
            const SizedBox(height: 30),
            LargePrimaryButton(
              title: '클릭이벤트 없는 토스트 메시지',
              widthOption: ButtonWidthOption.FULL,
              onTap: () {
                ToastMessage.defaultToast(message: '토스트 메시지 출력');
              },
            ),
          ],
        ),
      ),
    );
  }
}
