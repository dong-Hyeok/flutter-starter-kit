import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/asset_path/icon_path.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_control_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_text_styles.dart';

/// [CustomCheckBox]
///
/// *** 파라미터
/// -[isCheck]: 체크 상태 여부
/// -[value]: 체크박스 내용
/// -[type]: 체크박스 타입
class CustomCheckBox extends StatelessWidget {
  final bool isCheck;
  final String value;
  final CheckBoxType type;

  const CustomCheckBox({super.key, required this.isCheck, required this.value, required this.type});

  @override
  Widget build(BuildContext context) {
    String icon;
    TextStyle textStyle;

    switch (type) {
      case CheckBoxType.title:
        icon = isCheck ? IconPath.iconCheckCircle : IconPath.iconUncheckCircle;
        textStyle = MatchTextStyles.Headline2_SemiBold;
        break;
      case CheckBoxType.normal:
        icon = isCheck ? IconPath.iconCheckSquare : IconPath.iconUncheckSquare;
        textStyle = MatchTextStyles.Label1;
        break;
      case CheckBoxType.sub:
        icon = isCheck ? IconPath.iconCheck : IconPath.iconUncheck;
        textStyle = MatchTextStyles.Label1;
        break;
    }

    return Row(children: [SvgPicture.asset(icon), const SizedBox(width: 6.0), Text(value, style: textStyle)]);
  }
}
