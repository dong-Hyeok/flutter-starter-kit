import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timf_match/design_system/color/match_app_colors.dart';
import 'package:timf_match/design_system/style/match_message_styles.dart';
import 'package:timf_match/design_system/style/match_text_styles.dart';
import 'package:timf_match/design_system/widget/message/supporting_message.dart';
import 'package:timf_match/services/logger_service.dart';

/// [DefaultTextArea] 위젯
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
class MatchTextArea extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final int? maxLength;
  final int? maxLine;
  final bool isObscureText;
  final TextInputType textInputType;
  final bool isEnable;
  final bool isReadOnly;
  final VoidCallback? onTap;
  final String? initText; // ????????
  final FocusNode? focusNode;
  final FocusNode? toFocusNode;
  final bool isSuffix;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? textInputFormatterList;
  final String? helperText;
  final String? Function(String?)? errorTextValidator;

  const MatchTextArea({
    required this.controller,
    this.hintText,
    this.labelText,
    required this.maxLength,
    this.maxLine,
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
    super.key,
  });

  @override
  State<MatchTextArea> createState() => MatchTextAreaState();
}

class MatchTextAreaState extends State<MatchTextArea> {
  String? _errorText;
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isObscureText ? true : false; // 초기값으로 비밀번호 숨김 설정

    _updateHelperAndErrorText(widget.controller.text);
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
    LoggerService.logDebug('이거 실행됨');
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
          SupportingMessage(text: widget.helperText!, messageStyles: MatchMessageStyles.HELPER)
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
  Widget _defaultTextFiled() {
    return Stack(
      children: [
        TextFormField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          maxLength: widget.maxLength,
          maxLines: widget.maxLine,
          enabled: widget.isEnable,
          readOnly: widget.isReadOnly,
          onTap: widget.onTap,
          obscureText: isObscure,
          textAlignVertical: TextAlignVertical.top,
          inputFormatters: widget.textInputFormatterList,
          style: MatchTextStyles.Body1_Regular.copyWith(color: MatchAppColors.textColors.textDefault),
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
        ),
        Positioned(
          bottom: 4, // 텍스트 필드 하단에서 위치 조정
          right: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '${widget.controller.text.length}',
                style: MatchTextStyles.Body3_Regular.copyWith(color: MatchAppColors.textColors.textSoft),
              ),
              Text(
                '/${widget.maxLength}',
                style: MatchTextStyles.Body3_Medium.copyWith(color: MatchAppColors.textColors.textDefault),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// [InputDecoration]
  InputDecoration _defaultInputDecoration() {
    var outlineInputBorderDefault = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: _errorText == null ? MatchAppColors.strokeColors.strokeDefault : MatchAppColors.strokeColors.strokeError,
        width: 1,
      ),
    );

    var outlineInputBorderFocus = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: _errorText == null ? MatchAppColors.strokeColors.strokeFocus : MatchAppColors.strokeColors.strokeError,
        width: 1,
      ),
    );

    return InputDecoration(
      contentPadding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 20),
      filled: true,
      fillColor: widget.isEnable ? MatchAppColors.fillColors.fillDefault : MatchAppColors.fillColors.fillDisabled,
      hintText: widget.hintText ?? '',
      hintStyle: MatchTextStyles.Body1_Regular.copyWith(
          color: widget.isEnable ? MatchAppColors.textColors.textPlaceholder : MatchAppColors.textColors.textDisabled),
      border: outlineInputBorderDefault, // 기본 테두리 스타일
      focusedBorder: widget.onTap == null ? outlineInputBorderFocus : outlineInputBorderDefault, // 포커스 상태 테두리
      enabledBorder: outlineInputBorderDefault, // 활성화 상태 테두리
      disabledBorder: outlineInputBorderDefault, // 비활성화 상태 테두리
      counterText: '', // 텍스트 카운터 비활성
    );
  }
}
