import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/asset_path/icon_path.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// [CustomRadio]
///
/// *** 파라미터
/// -[isCheck]: 체크 상태 여부
/// -[value]: 라디오버튼 내용
/// -[imgUrl]: value 좌측 아이콘
class CustomRadio extends StatelessWidget {
  final bool isCheck;
  final String value;
  final String? imgUrl;

  const CustomRadio({
    super.key,
    required this.isCheck,
    required this.value,
    this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(isCheck ? IconPath.iconCheckRadio : IconPath.iconUncheckRadio),
        const SizedBox(width: 6.0),
        if (imgUrl != null) radioButtonImage() else const SizedBox.shrink(),
        Text(value, style: MatchTextStyles.Label1),
      ],
    );
  }

  Widget radioButtonImage() {
    return Row(
      children: [
        Image.network(imgUrl!, width: 24, height: 24),
        const SizedBox(width: 4.0),
      ],
    );
  }
}
