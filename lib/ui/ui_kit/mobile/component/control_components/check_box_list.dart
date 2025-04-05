import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/match_app_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/control/custom_check_box.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_control_styles.dart';

/// [CheckBoxList] 위젯
///
/// ### 파라미터:
/// - [contentList]: 체크박스로 표시할 데이터 리스트
/// - [checkBoxType]: 체크박스 스타일 타입
/// - [valueBuilder]: 라벨에 표시할 값 지정하는 함수
/// - [checkCount]: 최대 선택 가능 항목 수 (기본값: 1)
/// - [onCheckedListChanged]: 선택된 항목 상태 변화 콜백
/// - [isSepareated]: 항목 간 구분선 사용 여부
class CheckBoxList<T> extends StatefulWidget {
  final List<T> contentList;
  final CheckBoxType checkBoxType;
  final String Function(T) valueBuilder;
  final int checkCount;
  final ValueChanged<List<bool>>? onCheckedListChanged;
  final bool isSepareated;

  const CheckBoxList({
    required this.contentList,
    required this.checkBoxType,
    required this.valueBuilder,
    this.checkCount = 1,
    this.onCheckedListChanged,
    this.isSepareated = false,
    super.key,
  });

  @override
  CheckBoxListState<T> createState() => CheckBoxListState<T>();
}

class CheckBoxListState<T> extends State<CheckBoxList<T>> {
  late List<bool> isCheckedList;

  @override
  void initState() {
    super.initState();
    isCheckedList = List<bool>.filled(widget.contentList.length, false);
  }

  final _boxDecoration = BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: MatchAppColors.strokeColors.strokeSoft,
        width: 1.0,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.contentList.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: widget.isSepareated ? _boxDecoration : null,
          child: GestureDetector(
            onTap: () => _toggleCheckBox(index),
            child: CustomCheckBox(
              isCheck: isCheckedList[index],
              value: widget.valueBuilder(widget.contentList[index]),
              type: widget.checkBoxType,
            ),
          ),
        );
      },
    );
  }

  // 아이템 체크 메서드 (다중 선택 가능)
  void _toggleCheckBox(int index) {
    int checkedCount = isCheckedList.where((isChecked) => isChecked).length;

    setState(() {
      if (isCheckedList[index]) {
        isCheckedList[index] = false;
      } else if (checkedCount < widget.checkCount) {
        isCheckedList[index] = true;
      }
      widget.onCheckedListChanged?.call(isCheckedList);
    });
  }
}
