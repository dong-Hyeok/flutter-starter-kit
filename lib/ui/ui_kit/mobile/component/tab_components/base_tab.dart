import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/match_app_colors.dart';

/// [BaseTab]
///
/// ### 파라미터
/// -[tabs]: 탭 상단 위젯 리스트
/// -[tabViews]: 탭 바디 위젯 리스트
/// -[onTabChanged]: 탭 변경시 실행할 콜백 메서드 (변경된 페이지 인덱스 전달)
/// -[isPageSwipe]: 페이지 좌우 swipe 가능 여부 (default: true)
/// -[initialPageIndex]: 페이지 초기 인덱스 (default: 0)
/// -[tabBackgroundColor]: 탭 배경 Color
/// -[labelColor]: 선택 라벨 Color
/// -[unselectedLabelColor]: 선택되지 않은 라벨 Color
/// -[underlineColor]: 라벨 하단 라인 Color
class BaseTab extends StatefulWidget {
  final List<Tab> tabs;
  final List<Widget> tabViews;
  final void Function(int index) onTabChanged;
  final bool isPageSwipe;
  final int initialPageIndex;
  final Color? tabBackgroundColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final Color? underlineColor;

  const BaseTab({
    super.key,
    required this.tabs,
    required this.tabViews,
    required this.onTabChanged,
    this.isPageSwipe = true,
    this.initialPageIndex = 0,
    this.tabBackgroundColor,
    this.labelColor,
    this.unselectedLabelColor,
    this.underlineColor,
  });

  @override
  State<BaseTab> createState() => _BaseTabState();
}

class _BaseTabState extends State<BaseTab> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // 탭, 페이지 컨트롤러 초기화
    _tabController = TabController(
      length: widget.tabs.length,
      vsync: this,
      initialIndex: widget.initialPageIndex,
    );

    // 탭 리스너 등록
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        widget.onTabChanged(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          color: widget.tabBackgroundColor ?? MatchAppColors.fillColors.fillDefault_D,
          child: TabBar(
            controller: _tabController,
            labelColor: widget.labelColor ?? MatchAppColors.textColors.textPrimary,
            labelPadding: const EdgeInsets.symmetric(horizontal: 10.0),
            unselectedLabelColor: widget.unselectedLabelColor ?? MatchAppColors.textColors.textSoft,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 2.0,
                color: widget.underlineColor ?? MatchAppColors.strokeColors.strokePrimary,
              ),
            ),
            tabs: widget.tabs,
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: widget.isPageSwipe ? null : const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: widget.tabViews,
          ),
        ),
      ],
    );
  }
}
