import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/logger/app_logger';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/component/bottom_sheet_components/match_bottom_sheet.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/component/control_components/radio_button_list.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/component/header_components/match_header.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/large_primary_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/message/toast_message.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_button_styles.dart';
import 'package:get/get.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_text_styles.dart';

class Map {
  final String name;
  final int code;

  Map(
    this.name,
    this.code,
  );
}

class DesignSystemBottomSheet extends StatefulWidget {
  const DesignSystemBottomSheet({super.key});

  @override
  State<DesignSystemBottomSheet> createState() =>
      _DesignSystemBottomSheetState();
}

class _DesignSystemBottomSheetState extends State<DesignSystemBottomSheet> {
  final userList = [
    Map('Kakao Map', 1),
    Map('TMap', 2),
    Map('Naver Map', 3),
  ];

  final userLongList = [
    Map('Kakao Map', 1),
    Map('TMap', 2),
    Map('Naver Map', 3),
    Map('Kakao Map2', 4),
    Map('TMap2', 5),
    Map('Naver Map2', 6),
    Map('Kakao Map3', 7),
    Map('TMap3', 8),
    Map('Naver Map3', 9),
    Map('Kakao Map4', 10),
    Map('TMap4', 11),
    Map('Naver Map4', 12),
    Map('Kakao Map5', 13),
    Map('TMap5', 14),
    Map('Naver Map5', 15),
  ];

  String selectedMap = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MatchAppbar(
        title: "BottomSheet",
        // rightIcon: AppImages.iconAlertActiveInverse,
        onRightIconPressed: () {},
        isBackground: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('디폴트 바텀시트 예시', style: MatchTextStyles.Title),
              const SizedBox(height: 20),
              LargePrimaryButton(
                title: 'Height Fix Radio List(타이틀/바디/버튼 두개)',
                widthOption: ButtonWidthOption.FULL,
                onTap: () {
                  _showBottomSheet1();
                },
              ),
              const SizedBox(height: 20),
              LargePrimaryButton(
                title: 'Radio List(타이틀/바디/버튼 하나)',
                widthOption: ButtonWidthOption.FULL,
                onTap: () {
                  _showBottomSheet2();
                },
              ),
              const SizedBox(height: 20),
              LargePrimaryButton(
                title: 'Height Fix List(타이틀/버튼 없음)',
                widthOption: ButtonWidthOption.FULL,
                onTap: () {
                  _showBottomSheet3();
                },
              ),
              const SizedBox(height: 20),
              LargePrimaryButton(
                title: 'Radio List(타이틀 없음/버튼 한개)',
                widthOption: ButtonWidthOption.FULL,
                onTap: () {
                  _showBottomSheet4();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet1() {
    MatchBottomSheet.show(
      title: "내비게이션 선택",
      bodyWidget: bottomSheetBody2(),
      leftButtonTitle: '닫기',
      rightButtonTitle: '확인',
      onClickLeft: () {
        Get.back();
      },
      onClickRight: () {
        Get.back();
        ToastMessage.defaultToast(message: selectedMap);
      },
      isBarrierDismissible: false,
    );
  }

  void _showBottomSheet2() {
    MatchBottomSheet.show(
      title: "내비게이션 선택",
      bodyWidget: bottomSheetBody1(),
      rightButtonTitle: '확인',
      onClickRight: () {
        Get.back();
        ToastMessage.defaultToast(message: selectedMap);
      },
      onClickTitleIcon: () {
        ToastMessage.defaultToast(message: '아이콘 클릭!!');
      },
    );
  }

  void _showBottomSheet3() {
    MatchBottomSheet.show(
      title: "내비게이션 선택",
      bodyWidget: bottomSheetBody3(),
    );
  }

  void _showBottomSheet4() {
    MatchBottomSheet.show(
      bodyWidget: bottomSheetBody1(),
      rightButtonTitle: '확인',
      onClickRight: () {
        Get.back();
        ToastMessage.defaultToast(message: selectedMap);
      },
    );
  }

  /// 라디오 버튼 리스트 (버튼 필요!)
  /// 리스트 높이를 지정하지 않고 사용!
  Widget bottomSheetBody1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioButtonList<Map>(
          contentList: userList,
          valueBuilder: (map) => map.name,
          isSepareated: false,
          isShrinkWrap: true,
          onCheckedIndex: (index) {
            selectedMap = userList[index].name;
            LoggerService.logDebug("onCheckedIndex: $index");
          },
        ),
      ],
    );
  }

  /// 라디오 버튼 리스트 (버튼 필요!)
  /// 리스트 높이를 지정해서 사용!
  Widget bottomSheetBody2() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: RadioButtonList<Map>(
        contentList: userLongList,
        valueBuilder: (map) => map.name,
        isSepareated: false,
        isShrinkWrap: true,
        onCheckedIndex: (index) {
          selectedMap = userLongList[index].name;
          LoggerService.logDebug("onCheckedIndex: $index");
        },
      ),
    );
  }

  /// 바텀시트 버튼이 없음 -> 일반 리스트 사용(선택하면 바텀시트 off)
  /// 리스트 높이를 지정해서 사용!
  Widget bottomSheetBody3() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: userLongList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap: () {
                Get.back();
                ToastMessage.defaultToast(message: userLongList[index].name);
              },
              child: Text(
                userLongList[index].name,
                style: MatchTextStyles.Body1_Regular,
              ),
            ),
          );
        },
      ),
    );
  }
}
