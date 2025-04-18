import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/asset_path/icon_path.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/component/text_field_components/custom_text_area.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/component/text_field_components/custom_text_field.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/large_primary_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/message/toast_message.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/custom_button_styles.dart';

class DesignSystemTextField extends StatefulWidget {
  const DesignSystemTextField({super.key});

  @override
  State<DesignSystemTextField> createState() => _DesignSystemTextFieldState();
}

class _DesignSystemTextFieldState extends State<DesignSystemTextField> {
  // 스크롤 컨트롤 예시 (오류가 발생한 텍스트 필드로 이동하기 위해 사용)
  final ScrollController _scrollController = ScrollController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// [CustomTextField] 사용시 필요한 객체들
  /// FieldKey는 사용하고자 하는 TextField 타입을 지정해야 한다!
  final TextEditingController text1Controller = TextEditingController();
  final GlobalKey<CustomTextFieldState> text1FieldKey = GlobalKey<CustomTextFieldState>();
  final FocusNode _field1Focus = FocusNode();

  final TextEditingController text2Controller = TextEditingController();
  final GlobalKey<CustomTextFieldState> text2FieldKey = GlobalKey<CustomTextFieldState>();
  final FocusNode _field2Focus = FocusNode();

  final TextEditingController text3Controller = TextEditingController();
  final FocusNode _field3Focus = FocusNode();

  final TextEditingController text4Controller = TextEditingController();
  final FocusNode _field4Focus = FocusNode();

  final TextEditingController text5Controller = TextEditingController();
  final GlobalKey<CustomTextFieldState> text5FieldKey = GlobalKey<CustomTextFieldState>();
  final FocusNode _field5Focus = FocusNode();

  final TextEditingController text6Controller = TextEditingController();
  final GlobalKey<CustomTextAreaState> text6FieldKey = GlobalKey<CustomTextAreaState>();
  final FocusNode _field6Focus = FocusNode();

  @override
  void dispose() {
    _scrollController.dispose();
    text1Controller.dispose();
    text2Controller.dispose();
    text3Controller.dispose();
    text4Controller.dispose();
    text5Controller.dispose();
    text6Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TextField")),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Form(
            // key: formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: text1Controller,
                  labelText: '1. 기본이얌',
                  hintText: '플레이스 홀더얌',
                  helperText: '헬퍼 텍스트얌!',
                  errorTextValidator: validateErrorText,
                  key:
                      text1FieldKey, // GlobalKey 전달(이걸 전달해야 CustomTextField의 validate를 호출할 수 있다.)
                  focusNode:
                      _field1Focus, // 포커스 전달(포커스를 전달해야 x 버튼이 포커스가 있을때 상태를 감지할 수 있다.)
                  toFocusNode: _field2Focus,
                ),
                const SizedBox(height: 60),
                CustomTextField(
                  controller: text2Controller,
                  labelText: '2.좌우 아이콘 추가된거얌',
                  hintText: '플레이스 홀더얌',
                  key:
                      text2FieldKey, // GlobalKey 전달(이걸 전달해야 CustomTextField의 validate를 호출할 수 있다.)
                  focusNode:
                      _field2Focus, // 포커스 전달(포커스를 전달해야 x 버튼이 포커스가 있을때 상태를 감지할 수 있다.)
                  toFocusNode: _field3Focus,
                  errorTextValidator: validateErrorText,
                  preffixIconAsset: IconPath.iconCircleQuestion,
                  onClickPreffixIcon: () {
                    ToastMessage.defaultToast(message: 'preffix 아이콘 클릭!');
                  },
                  suffixIconAsset:  IconPath.iconCircleQuestion,
                  onClickSuffixIcon: () {
                    ToastMessage.defaultToast(message: 'suffix 아이콘 클릭!');
                  },
                ),
                const SizedBox(height: 60),
                CustomTextField(
                  controller: text3Controller,
                  labelText: '비활성화',
                  hintText: '비활성화 된 상태',
                  isEnable: false,
                  focusNode: _field3Focus,
                  toFocusNode: _field4Focus,
                ),
                const SizedBox(height: 60),
                CustomTextField(
                  controller: text4Controller,
                  labelText: '읽기 전용',
                  hintText: '읽기 전용이얍',
                  isReadOnly: true,
                  focusNode: _field4Focus,
                  toFocusNode: _field5Focus,
                  onTap: () {
                    ToastMessage.defaultToast(message: 'onTap 호출');
                  },
                ),
                const SizedBox(height: 60),
                CustomTextField(
                  controller: text5Controller,
                  labelText: '비밀번호 입력 예시',
                  hintText: '플레이스홀더얌',
                  key:
                      text5FieldKey, // GlobalKey 전달(이걸 전달해야 CustomTextField의 validate를 호출할 수 있다.)
                  focusNode:
                      _field5Focus, // 포커스 전달(포커스를 전달해야 x 버튼이 포커스가 있을때 상태를 감지할 수 있다.)
                  toFocusNode: _field6Focus,
                  isObscureText: true,
                ),
                const SizedBox(height: 40),
                CustomTextArea(
                  controller: text6Controller,
                  errorTextValidator: validateErrorText,
                  labelText: 'Text Area',
                  hintText: '플레이스홀더얌',
                  helperText: '헬퍼 텍스트얌!',
                  key:
                      text6FieldKey, // GlobalKey 전달(이걸 전달해야 CustomTextField의 validate를 호출할 수 있다.)
                  focusNode:
                      _field6Focus, // 포커스 전달(포커스를 전달해야 x 버튼이 포커스가 있을때 상태를 감지할 수 있다.)
                  maxLength: 100,
                ),
                const SizedBox(height: 60),
                LargePrimaryButton(
                  title: '레이블1 validate',
                  widthOption: ButtonWidthOption.FULL,
                  onTap: () {
                    // 각 텍스트 필드별 유효성 검사 결과 & 스크롤 이동(에러 발생 - 내림차순 기준 첫 번째)
                    var result1 = text1FieldKey.currentState?.validate();
                    var result2 = text2FieldKey.currentState?.validate();
                    var result6 = text6FieldKey.currentState?.validate();

                    // 1. 포커스 해제
                    FocusScope.of(context).unfocus();

                    // 2. 에러가 발생한 필드로 스크롤 이동
                    if (result1 == false) {
                      _scrollToFocusNode(_field1Focus);
                    } else if (result2 == false) {
                      _scrollToFocusNode(_field2Focus);
                    } else if (result6 == false) {
                      _scrollToFocusNode(_field6Focus);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 에러 텍스트 검증 메서드
  String? validateErrorText(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    } else if (value.isNotEmpty && value.length > 3) {
      return "4글자 이상 입력하면 에러 뜸ㅎㅎㅎㅎ.";
    }
    return null;
  }

  void _scrollToFocusNode(FocusNode focusNode) {
    // 프레임 렌더링이 끝난 후 실행
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 포커스된 위젯의 RenderObject 가져오기
      RenderObject? object = focusNode.context?.findRenderObject();

      // RenderBox일 경우 위치 계산
      if (object is RenderBox) {
        // 위젯의 화면 내 위치를 가져오기
        double yPosition = object.localToGlobal(Offset.zero).dy;

        // 스크롤 애니메이션 실행
        _scrollController.animateTo(
          _scrollController.offset + yPosition - 150, // 150px 상단 여백
          duration: const Duration(milliseconds: 300), // 0.5초 동안 부드럽게 이동
          curve: Curves.easeInOut, // easeInOut 곡선으로 자연스럽게 스크롤
        );
      }
    });
  }
}
