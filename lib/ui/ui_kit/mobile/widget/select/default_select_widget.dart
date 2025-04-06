import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/asset_path/icon_path.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/match_app_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/message/supporting_message.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_message_styles.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// [DefaultSelectWidget]
///
/// ### 파라미터:
/// - [controller]: TextEditingController
/// - [hintText]: 텍스트 필드 입력 전 보이는 텍스트
/// - [labelText]: 상단 레이블 텍스트
/// - [isEnable]: 텍스트 필드 활성화 여부
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
class DefaultSelectWidget extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final bool isEnable;
  final VoidCallback? onTap;
  final String? initText;
  final FocusNode? focusNode;
  final FocusNode? toFocusNode;
  final bool isSuffix;
  final String? helperText;
  final String? Function(String?)? errorTextValidator;
  final String? preffixIconAsset;
  final VoidCallback? onClickPreffixIcon;

  final ValueChanged<String>? onChanged;
  const DefaultSelectWidget({
    required this.controller,
    this.hintText,
    this.labelText,
    this.isEnable = true,
    this.onTap,
    this.initText,
    this.focusNode,
    this.toFocusNode,
    this.isSuffix = false,
    this.onChanged,
    this.helperText,
    this.errorTextValidator,
    this.preffixIconAsset,
    this.onClickPreffixIcon,
    super.key,
  });

  @override
  State<DefaultSelectWidget> createState() => DefaultSelectWidgetState();
}

class DefaultSelectWidgetState extends State<DefaultSelectWidget> {
  String? _errorText;

  @override
  void initState() {
    super.initState();
  }

  // 부모 위젯에서 전달된 파라미터가 바뀌었을 때 호출
  @override
  void didUpdateWidget(covariant DefaultSelectWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // initText가 바뀌었는지 체크하고 텍스트 업데이트
    if (widget.initText != oldWidget.initText && widget.initText != widget.controller.text) {
      widget.controller.text = widget.initText ?? '';
      _updateHelperAndErrorText(widget.controller.text); // 에러 상태도 함께 갱신
    }
  }

  @override
  void dispose() {
    super.dispose();
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
        // (중단) 텍스트 필드
        _defaultTextFiled(),
        // (하단) 상태 메시지
        const SizedBox(height: 4.0),
        if (_errorText != null)
          SupportingMessage(text: _errorText!, messageStyles: MatchMessageStyles.ERROR)
        else if (widget.helperText != null)
          SupportingMessage(text: widget.helperText!, messageStyles: MatchMessageStyles.HELPER),
      ],
    );
  }

  /// [라벨]
  Widget _defaultLabel() {
    return widget.labelText != null
        ? Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(widget.labelText!, style: MatchTextStyles.Label1),
        )
        : const SizedBox.shrink();
  }

  /// [TextFormField]
  TextFormField _defaultTextFiled() {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      maxLength: 1,
      maxLines: 1,
      enabled: widget.isEnable,
      readOnly: true,
      onTap: widget.onTap,
      style: MatchTextStyles.Body1_Regular.copyWith(
        color:
            widget.isEnable
                ? MatchAppColors.textColors.textDefault
                : MatchAppColors.textColors.textDisabled,
      ),
      decoration: _defaultInputDecoration(),
      onChanged: (value) {
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
    );
  }

  /// [InputDecoration]
  InputDecoration _defaultInputDecoration() {
    var outlineInputBorderDefault = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color:
            _errorText == null
                ? MatchAppColors.strokeColors.strokeDefault
                : MatchAppColors.strokeColors.strokeError,
        width: 1,
      ),
    );

    var outlineInputBorderFocus = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color:
            _errorText == null
                ? MatchAppColors.strokeColors.strokeStrong
                : MatchAppColors.strokeColors.strokeError,
        width: 1,
      ),
    );

    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      filled: true,
      fillColor:
          widget.isEnable
              ? MatchAppColors.fillColors.fillDefault
              : MatchAppColors.fillColors.fillDisabled,
      hintText: widget.hintText ?? '',
      hintStyle: MatchTextStyles.Body1_Regular.copyWith(
        color:
            widget.isEnable
                ? MatchAppColors.textColors.textPlaceholder
                : MatchAppColors.textColors.textDisabled,
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
        SvgPicture.asset(IconPath.iconDropArrow, height: 24, width: 24),
        const SizedBox(width: 12.0),
      ],
    );
  }
}
