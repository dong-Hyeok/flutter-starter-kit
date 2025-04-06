import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/large_primary_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/select/default_select_widget.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_button_styles.dart';

class DesignSystemSelect extends StatelessWidget {
  DesignSystemSelect({super.key});

  final TextEditingController text1Controller = TextEditingController();
  final GlobalKey<DefaultSelectWidgetState> text1FieldKey =
      GlobalKey<DefaultSelectWidgetState>();
  // final FocusNode _field1Focus = FocusNode();

  final TextEditingController text2Controller = TextEditingController();
  final GlobalKey<DefaultSelectWidgetState> text2FieldKey =
      GlobalKey<DefaultSelectWidgetState>();
  // final FocusNode _field2Focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select")),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              DefaultSelectWidget(
                labelText: 'Select 예시 1',
                controller: text1Controller,
                key: text1FieldKey,
                errorTextValidator: validateErrorText,
                hintText: 'Select Hint',
              ),
              const SizedBox(height: 20),
              DefaultSelectWidget(
                labelText: 'Select 예시 2',
                controller: text2Controller,
                key: text2FieldKey,
                errorTextValidator: validateErrorText,
                hintText: 'Select Hint',
                helperText: 'helper text 예시',
              ),
              const SizedBox(height: 60),
              DefaultSelectWidget(
                controller: text1Controller,
                hintText: '이건 라벨이 없는 Select',
              ),
              const SizedBox(height: 20),
              DefaultSelectWidget(
                controller: text1Controller,
                hintText: '이건 비활성화 상태 ㅎ',
                isEnable: false,
              ),
              const Spacer(),
              LargePrimaryButton(
                title: '레이블1 validate',
                widthOption: ButtonWidthOption.FULL,
                onTap: () {
                  text1FieldKey.currentState?.validate();
                  text2FieldKey.currentState?.validate();
                },
              ),
            ],
          )),
    );
  }

  /// 에러 텍스트 검증 메서드
  String? validateErrorText(String? value) {
    if (value == null || value.isEmpty) {
      return '선택해 주세요!';
    } else if (value.isNotEmpty && value.length > 3) {
      return "4글자 이상 입력하면 에러 뜸ㅎㅎㅎㅎ.";
    }
    return null;
  }
}
