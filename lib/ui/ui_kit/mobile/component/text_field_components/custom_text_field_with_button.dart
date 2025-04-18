import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter_kit/core/asset_path/icon_path.dart';
import 'package:flutter_starter_kit/data/controller/util_controller/timer_controller.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/large_primary_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/large_secondary_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/custom_button_styles.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/custom_textfield_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/app_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/message/supporting_message.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/custom_message_styles.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/text_styles.dart';

/// [CustomTextFieldWithButton] 컴포넌트
/// ### 텍스트 필드와 우측 버튼이 함께 있는 컴포넌트
///
///
/// ### 파라미터:
/// - [controller]: TextEditingController
/// - [hintText]: 텍스트 필드 입력 전 보이는 텍스트
/// - [labelText]: 상단 레이블 텍스트
/// - [maxLength]: 최대 길이 지정
/// - [maxLine]: 최대 라인 수(기본값 한 줄)
/// - [isObscureText]: 텍스트 필드에서 입력한 내용 가릴지 여부 (Default: false == 가리지 않음)
/// - [textInputType]: 텍스트 인풋 타입 (Default: text)
/// - [isEnable]: 텍스트 필드 활성화 여부
/// - [isReadOnly]: 텍스트 필드 읽기 전용 여부
/// - [onTap]: 텍스트 필드 터치시 발생할 이벤트
/// - [initText]: 텍스트 필드에
/// - [focusNode]: 텍스트 필드 포커스
/// - [toFocusNode]: "이동할" 텍스트 필드 포커스
/// - [onChanged]: 커스텀 onChange
/// - [textInputFormatterList]: 인풋 포멧터
/// - [helperText]: 도움말 메시지
/// - [errorTextValidator]: 텍스트 필드 입력 내용 체크하는 커스텀 메서드
/// - [preffixIconAsset]: 왼쪽 아이콘 에셋
/// - [onClickPreffixIcon]: 왼쪽 아이콘 에셋 클릭 이벤트
/// - [suffixIconAsset]: 오른쪽 아이콘 에셋
/// - [onClickSuffixIcon]: 오른쪽 아이콘 에셋 클릭 이벤트
/// - [buttonText]: 우측 버튼 텍스트
/// - [onButtonTap]: 우측 버튼 클릭 이벤트
class CustomTextFieldWithButton extends StatefulWidget {
  // TextField Options
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final int? maxLength;
  final int maxLine;
  final bool isObscureText;
  final TextInputType textInputType;
  final bool isEnable;
  final bool isReadOnly;
  final VoidCallback? onTap;
  final String? initText;
  final FocusNode? focusNode;
  final FocusNode? toFocusNode;
  final bool isSuffix;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? textInputFormatterList;
  final String? helperText;
  final String? Function(String?)? errorTextValidator;
  final String? preffixIconAsset;
  final VoidCallback? onClickPreffixIcon;
  final String? suffixIconAsset;
  final VoidCallback? onClickSuffixIcon;
  // Button Options
  final String buttonText;
  final CustomTextFieldWithButtonStyles buttonStyle;
  final FutureOr<void> Function()? onButtonTap;
  // Timer Options
  final bool isTimer;

  const CustomTextFieldWithButton({
    required this.controller,
    this.hintText,
    this.labelText,
    this.maxLength,
    this.maxLine = 1,
    this.isObscureText = false,
    this.textInputType = TextInputType.text,
    this.isEnable = true,
    this.isReadOnly = false,
    this.onTap,
    this.initText,
    this.focusNode,
    this.toFocusNode,
    this.isSuffix = false,
    this.onChanged,
    this.textInputFormatterList,
    this.helperText,
    this.errorTextValidator,
    this.preffixIconAsset,
    this.onClickPreffixIcon,
    this.suffixIconAsset,
    this.onClickSuffixIcon,
    required this.buttonText,
    required this.buttonStyle,
    this.onButtonTap,
    this.isTimer = false,
    super.key,
  });

  @override
  State<CustomTextFieldWithButton> createState() => CustomTextFieldWithButtonState();
}

class CustomTextFieldWithButtonState extends State<CustomTextFieldWithButton> {
  String? _errorText;
  bool _isFocused = false;
  late bool isObscure;

  @override
  void initState() {
    super.initState();

    // 초기값으로 비밀번호 숨김 설정
    isObscure = widget.isObscureText ? true : false;

    // 포커스 리스너 등록
    if (widget.focusNode != null) {
      widget.focusNode!.addListener(_onFocusChange);
    }
  }

  // 부모 위젯에서 전달된 파라미터가 바뀌었을 때 호출
  @override
  void didUpdateWidget(covariant CustomTextFieldWithButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    // initText가 바뀌었는지 체크하고 텍스트 업데이트
    if (widget.initText != oldWidget.initText && widget.initText != widget.controller.text) {
      widget.controller.text = widget.initText ?? '';
      _updateHelperAndErrorText(widget.controller.text);
    }
  }

  @override
  void dispose() {
    if (widget.focusNode != null) {
      widget.focusNode!.removeListener(_onFocusChange);
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      if (widget.focusNode != null) {
        _isFocused = widget.focusNode!.hasFocus;
      }
    });
  }

  // 외부에서 호출할 수 있는 validate 메서드 (버튼 클릭시 체크 용도로 사용)
  bool validate() {
    _updateHelperAndErrorText(widget.controller.text);

    return _errorText == null ? true : false;
  }

  void _updateHelperAndErrorText(String value) {
    setState(() {
      _errorText = widget.errorTextValidator?.call(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // (상단) 레이블
        _defaultLabel(),
        // (중단) 텍스트 필드 + 버튼
        Flex(
          direction: Axis.horizontal,
          children: [
            _defaultTextFiled(),
            const SizedBox(width: 8.0),
            _getButton(widget.buttonStyle),
          ],
        ),
        // (하단) 상태 메시지
        const SizedBox(height: 4.0),
        if (_errorText != null)
          SupportingMessage(text: _errorText!, messageStyles: CustomMessageStyles.ERROR)
        else if (widget.helperText != null)
          SupportingMessage(text: widget.helperText!, messageStyles: CustomMessageStyles.HELPER),
      ],
    );
  }

  /// [우측 버튼 선택]
  Widget _getButton(CustomTextFieldWithButtonStyles style) {
    switch (style) {
      case CustomTextFieldWithButtonStyles.LARGE_PRIMARY:
        return LargePrimaryButton(
          title: widget.buttonText,
          onTap: widget.onButtonTap,
          widthOption: ButtonWidthOption.CUSTOM,
          customWidth: 80,
        );
      case CustomTextFieldWithButtonStyles.LARGE_SECONDARY:
        return LargeSecondaryButton(
          title: widget.buttonText,
          onTap: widget.onButtonTap,
          widthOption: ButtonWidthOption.CUSTOM,
          customWidth: 80,
        );
    }
  }

  /// [라벨]
  Widget _defaultLabel() {
    return widget.labelText != null
        ? Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(widget.labelText!, style: TextStyles.Label1),
        )
        : const SizedBox.shrink();
  }

  /// [TextFormField]
  Widget _defaultTextFiled() {
    return Expanded(
      child: SizedBox(
        height: 52,
        child: TextFormField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          maxLength: widget.maxLength,
          maxLines: 1,
          enabled: widget.isEnable,
          readOnly: widget.isReadOnly,
          onTap: widget.onTap,
          obscureText: isObscure,
          inputFormatters: widget.textInputFormatterList,
          style: TextStyles.Body1_Regular.copyWith(
            color:
                widget.isEnable
                    ? AppColors.textColors.textDefault
                    : AppColors.textColors.textDisabled,
          ),
          decoration: _defaultInputDecoration(),
          onChanged: (value) {
            // 이건 옵션으로 넣어서 입력마다 체크하도록 해도 될듯?
            // _updateHelperAndErrorText(value);

            setState(() {
              _errorText = null;
            });

            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          onFieldSubmitted: (value) {
            if (widget.toFocusNode != null) {
              FocusScope.of(context).requestFocus(widget.toFocusNode);
            }
          },
        ),
      ),
    );
  }

  /// [InputDecoration]
  InputDecoration _defaultInputDecoration() {
    var outlineInputBorderDefault = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color:
            _errorText == null
                ? AppColors.strokeColors.strokeDefault
                : AppColors.strokeColors.strokeError,
        width: 1,
      ),
    );

    var outlineInputBorderFocus = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color:
            _errorText == null
                ? AppColors.strokeColors.strokeFocus
                : AppColors.strokeColors.strokeError,
        width: 1,
      ),
    );

    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      filled: true,
      fillColor:
          widget.isEnable
              ? AppColors.fillColors.fillDefault : AppColors.fillColors.fillDisabled,
      hintText: widget.hintText ?? '',
      hintStyle: TextStyles.Body1_Regular.copyWith(
        color:
            widget.isEnable
                ? AppColors.textColors.textPlaceholder
                : AppColors.textColors.textDisabled,
      ),
      border: outlineInputBorderDefault, // 기본 테두리 스타일
      focusedBorder:
          widget.onTap == null ? outlineInputBorderFocus : outlineInputBorderDefault, // 포커스 상태 테두리
      enabledBorder: outlineInputBorderDefault, // 활성화 상태 테두리
      disabledBorder: outlineInputBorderDefault, // 비활성화 상태 테두리
      prefixIcon: preffixIconWidget(),
      suffixIcon: suffixIconWidget(),
      prefixIconConstraints: const BoxConstraints(minHeight: 24),
      suffixIconConstraints: const BoxConstraints(minHeight: 24),
      counterText: '', // 텍스트 카운터 비활성
    );
  }

  /// [PreffixIcon] 위젯
  Widget preffixIconWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 12.0),
        // 옵션 아이콘
        if (widget.preffixIconAsset != null)
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: GestureDetector(
              onTap: widget.onClickPreffixIcon,
              child: SvgPicture.asset(widget.preffixIconAsset!, height: 24, width: 24),
            ),
          ),
      ],
    );
  }

  /// [SuffixIcon] 위젯
  Widget suffixIconWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Timer 사용 여부 && widget.isEnable
        if (widget.isTimer) ...{if (widget.isEnable) _timerWidget() else _successWidget()},

        // (x) 아이콘은 고정 && 포커스가 있을때만 visible
        if (_isFocused)
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: GestureDetector(
              onTap: () {
                widget.controller.clear();
                setState(() {
                  _errorText = null;
                });
              },
              child: SvgPicture.asset(IconPath.iconGrayCircleDelete, height: 24, width: 24),
            ),
          ),

        // 비밀번호 아이콘 (옵션 아이콘 없으면서 && 비밀번호 타입 사용시)
        if (widget.suffixIconAsset == null && widget.isObscureText)
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isObscure = !isObscure; // 클릭 시 isObscure 상태를 토글하여 비밀번호 표시/숨기기 전환
                });
              },
              child: Icon(
                isObscure ? Icons.visibility_off : Icons.visibility, // isObscure 상태에 따라 아이콘 변경
                color: AppColors.iconColors.iconSoft,
              ),
            ),
          ),

        // 옵션 SuffixIcon
        if (widget.suffixIconAsset != null)
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: GestureDetector(
              onTap: widget.onClickSuffixIcon,
              child: SvgPicture.asset(widget.suffixIconAsset!, height: 24, width: 24),
            ),
          ),
        const SizedBox(width: 12.0),
      ],
    );
  }

  Padding _successWidget() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: IntrinsicWidth(
        child: Center(
          child: Text(
            "인증 성공",
            style: TextStyles.Caption1.copyWith(color: AppColors.textColors.textActive),
          ),
        ),
      ),
    );
  }

  Widget _timerWidget() {
    final timerController = Get.find<TimerController>();

    return Obx(() {
      if (timerController.isTimer.value) {
        return Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: IntrinsicWidth(
            child: Center(
              child: Obx(() {
                final minutes = (timerController.remainingSeconds.value ~/ 60).toString().padLeft(
                  2,
                  '',
                );
                final seconds = (timerController.remainingSeconds.value % 60).toString().padLeft(
                  2,
                  '0',
                );
                return Text(
                  "$minutes:$seconds",
                  style: TextStyles.Caption1.copyWith(
                    color:
                        _errorText == null
                            ? AppColors.textColors.textActive
                            : AppColors.textColors.textError,
                  ),
                );
              }),
            ),
          ),
        );
      } else {
        return const SizedBox.shrink(); // 타이머가 비활성화된 경우 빈 공간을 반환
      }
    });
  }
}
