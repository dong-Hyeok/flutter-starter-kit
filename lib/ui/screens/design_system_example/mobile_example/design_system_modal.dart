import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/logger/app_logger';
import 'package:flutter_starter_kit/ui/ui_kit/color/match_app_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/component/control_components/radio_button_list.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/component/header_components/match_header.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/component/modal_components/match_custom_modal.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/component/modal_components/match_default_modal.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/large_primary_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/message/toast_message.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_button_styles.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_text_styles.dart';
import 'package:get/get.dart';

class Map {
  final String name;
  final int code;

  Map(
    this.name,
    this.code,
  );
}

class DesignSystemModal extends StatefulWidget {
  const DesignSystemModal({super.key});

  @override
  State<DesignSystemModal> createState() => _DesignSystemModalState();
}

class _DesignSystemModalState extends State<DesignSystemModal> {
  final userList = [
    Map('Kakao Map', 1),
    Map('TMap', 2),
    Map('Naver Map', 3),
  ];

  String selectedMap = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MatchAppbar(
        title: "Modal",
        onRightIconPressed: () {},
        isBackground: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('디폴트 모달 예시', style: MatchTextStyles.Title),
              const SizedBox(height: 20),
              LargePrimaryButton(
                title: '디폴트 모달(타이틀/바디/버튼 두개)',
                widthOption: ButtonWidthOption.FULL,
                onTap: () {
                  _showDialog1();
                },
              ),
              const SizedBox(height: 20),
              LargePrimaryButton(
                title: '디폴트 모달(타이틀/바디/버튼 하나)',
                widthOption: ButtonWidthOption.FULL,
                onTap: () {
                  _showDialog2();
                },
              ),
              const SizedBox(height: 20),
              LargePrimaryButton(
                title: '디폴트 모달(타이틀/버튼 두개)',
                widthOption: ButtonWidthOption.FULL,
                onTap: () {
                  _showDialog3();
                },
              ),
              const SizedBox(height: 20),
              LargePrimaryButton(
                title: '디폴트 모달(타이틀/버튼 한개)',
                widthOption: ButtonWidthOption.FULL,
                onTap: () {
                  _showDialog4();
                },
              ),
              const SizedBox(height: 100),
              const Text('커스텀 모달 예시', style: MatchTextStyles.Title),
              const SizedBox(height: 20),
              LargePrimaryButton(
                title: '커스텀 모달 (정적 일반)',
                widthOption: ButtonWidthOption.FULL,
                onTap: () {
                  _showCustomModal1();
                },
              ),
              const SizedBox(height: 20),
              LargePrimaryButton(
                title: '커스텀 모달 (동적 - 라디오 리스트)',
                widthOption: ButtonWidthOption.FULL,
                onTap: () {
                  _showCustomModal2();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog1() {
    MatchDefaultModal.show(
      title: '타이틀!',
      body: '바디바디!!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~',
      leftButtonTitle: '닫기',
      rightButtonTitle: '확인',
      onClickLeft: () {
        Get.back();
      },
      onClickRight: () {
        Get.back();
      },
    );
  }

  void _showDialog2() {
    MatchDefaultModal.show(
      title: '타이틀!',
      body: '바디바디!!',
      rightButtonTitle: '확인',
      onClickRight: () {
        Get.back();
      },
    );
  }

  void _showDialog3() {
    MatchDefaultModal.show(
      title: '타이틀!',
      leftButtonTitle: '닫기',
      rightButtonTitle: '확인',
      onClickLeft: () {
        Get.back();
      },
      onClickRight: () {
        Get.back();
      },
    );
  }

  void _showDialog4() {
    MatchDefaultModal.show(
      title: '타이틀!',
      rightButtonTitle: '확인',
      onClickRight: () {
        Get.back();
      },
    );
  }

  void _showCustomModal1() {
    MatchCustomModal.show(
      bodyWidget: customDialogBody1(),
      rightButtonTitle: '확인',
      onClickRight: () {
        Get.back();
      },
    );
  }

  Column customDialogBody1() {
    return Column(
      children: [
        Text('출근 확정하시겠습니까?',
            style: MatchTextStyles.Title.copyWith(
                color: MatchAppColors.textColors.textStrong)),
      ],
    );
  }

  void _showCustomModal2() {
    MatchCustomModal.show(
      bodyWidget: customDialogBody2(),
      leftButtonTitle: '닫기',
      rightButtonTitle: '확인',
      onClickLeft: () {
        Get.back();
      },
      onClickRight: () {
        Get.back();
        ToastMessage.defaultToast(message: selectedMap);
      },
    );
  }

  Widget customDialogBody2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('내비게이션 선택',
            style: MatchTextStyles.Title.copyWith(
                color: MatchAppColors.textColors.textStrong)),
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
}
