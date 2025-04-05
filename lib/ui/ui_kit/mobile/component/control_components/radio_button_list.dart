import 'package:flutter/material.dart';
import 'package:timf_match/design_system/color/match_app_colors.dart';
import 'package:timf_match/design_system/widget/control/custom_radio.dart';

/// [RadioButtonList] 위젯
///
/// ### 파라미터:
/// - [contentList]: 라디오 버튼으로 표시할 데이터 리스트
/// - [valueBuilder]: 라벨에 표시할 값 지정하는 함수
/// - [onCheckedIndex]: 선택된 항목의 인덱스를 반환하는 콜백
/// - [initCheckedIndex]: 초기 선택 값 (default: 0)
/// - [isSepareated]: 항목 간 구분선 표시 여부
/// - [isShrinkWrap]: 리스트의 높이가 내부 요소의 크기만큼 자동으로 조절 여부(true: 내부 요소만큼 높이 조절)
class RadioButtonList<T> extends StatefulWidget {
  final List<T> contentList;
  final String Function(T) valueBuilder;
  final ValueChanged<int>? onCheckedIndex;
  final int initCheckedIndex;
  final bool isSepareated;
  final bool isShrinkWrap;

  const RadioButtonList({
    required this.contentList,
    required this.valueBuilder,
    this.onCheckedIndex,
    this.initCheckedIndex = 0,
    this.isSepareated = false,
    this.isShrinkWrap = false,
    super.key,
  });

  @override
  RadioButtonListState<T> createState() => RadioButtonListState<T>();
}

class RadioButtonListState<T> extends State<RadioButtonList<T>> {
  int? selectedIndex;

  final _boxDecoration = BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: MatchAppColors.strokeColors.strokeSoft,
        width: 1.0,
      ),
    ),
  );

  @override
  void initState() {
    super.initState();

    // 초기 선택 값 지정
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.contentList.isNotEmpty) {
        setState(() {
          selectedIndex = widget.initCheckedIndex;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: widget.isShrinkWrap,
      padding: EdgeInsets.zero,
      itemCount: widget.contentList.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: widget.isSepareated ? _boxDecoration : null,
          child: GestureDetector(
            onTap: () => _toggleRadio(index),
            child: CustomRadio(
              isCheck: selectedIndex == index,
              value: widget.valueBuilder(widget.contentList[index]),
            ),
          ),
        );
      },
    );
  }

  // 아이템 체크 메서드 (라디오 - 오직 하나만 체크 가능)
  void _toggleRadio(int index) {
    setState(() {
      selectedIndex = index;
      widget.onCheckedIndex?.call(selectedIndex ?? -1);

      // if (selectedIndex == index) {
      //   selectedIndex = null;
      // } else {
      // selectedIndex = index;
      // widget.onCheckedIndex?.call(selectedIndex ?? -1);
      // }
      // widget.onCheckedIndex?.call(selectedIndex ?? -1);
    });
  }
}
