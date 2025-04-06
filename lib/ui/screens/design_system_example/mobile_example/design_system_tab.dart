import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/logger/app_logger';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/component/tab_components/base_tab.dart';

class DesignSystemTab extends StatelessWidget {
  const DesignSystemTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tab")),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: BaseTab(
              tabs: const [
                Tab(text: "TOP_TAB_1"),
                Tab(text: "TOP_TAB_2"),
                Tab(text: "TOP_TAB_3"),
              ],
              tabViews: const [
                Center(child: Text('Page_1')),
                Center(child: Text('Page_2\n(초기 페이지로 설정!! - 코드 참고)')),
                Center(child: Text('Page_3')),
              ],
              onTabChanged: (index) {
                LoggerService.logDebug('Top Tab changed to: $index');
              },
              initialPageIndex: 1,
            ),
          ),
          Expanded(
            flex: 1,
            child: BaseTab(
              tabs: const [
                Tab(text: "BOTTOM_TAB_1"),
                Tab(text: "BOTTOM_TAB_2"),
                Tab(text: "BOTTOM_TAB_3"),
              ],
              tabViews: const [
                Center(child: Text('Page_1\nPage Swipe false')),
                Center(child: Text('Page_2\nPage Swipe false')),
                Center(child: Text('Page_3\nPage Swipe false')),
              ],
              onTabChanged: (index) {
                LoggerService.logDebug('Bottom Tab changed to: $index');
              },
              isPageSwipe: false,
            ),
          ),
        ],
      ),
    );
  }
}
