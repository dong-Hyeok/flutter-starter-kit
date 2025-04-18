import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/logger/app_logger';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/component/control_components/check_box_list.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/component/control_components/radio_button_list.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/control/custom_check_box.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/control/custom_radio.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/custom_control_styles.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/text_styles.dart';


class User {
  final String name;
  final int age;

  User(this.name, this.age);
}

class DesignSystemControl extends StatelessWidget {
  DesignSystemControl({super.key});

  final userList = [
    User('Alice', 25),
    User('Bob', 30),
    User('Charlie', 35),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Control")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomCheckBox(
                      isCheck: true, value: '라벨', type: CheckBoxType.title),
                  CustomCheckBox(
                      isCheck: true, value: '라벨', type: CheckBoxType.normal),
                  CustomCheckBox(
                      isCheck: true, value: '라벨', type: CheckBoxType.sub),
                ],
              ),
              const SizedBox(height: 8.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomCheckBox(
                      isCheck: false, value: '라벨', type: CheckBoxType.title),
                  CustomCheckBox(
                      isCheck: false, value: '라벨', type: CheckBoxType.normal),
                  CustomCheckBox(
                      isCheck: false, value: '라벨', type: CheckBoxType.sub),
                ],
              ),
              const SizedBox(height: 8.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRadio(isCheck: true, value: '라벨'),
                  CustomRadio(
                    isCheck: true,
                    value: '라벨',
                    imgUrl:
                        'https://timf-data.s3.ap-northeast-2.amazonaws.com/TMS_FTP/fileUpload/common/bank/0002.png',
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRadio(isCheck: false, value: '라벨'),
                  CustomRadio(
                    isCheck: false,
                    value: '라벨',
                    imgUrl:
                        'https://timf-data.s3.ap-northeast-2.amazonaws.com/TMS_FTP/fileUpload/common/bank/0002.png',
                  ),
                ],
              ),
              const SizedBox(height: 48.0),
              // const CustomToggle(),
              // const SizedBox(height: 48.0),
              // 체크 박스 리스트
              const Text(
                '1. 체크박스 리스트 컴포넌트',
                style: TextStyles.Body1_Medium,
              ),
              const SizedBox(height: 12.0),
              SizedBox(
                height: 150,
                child: CheckBoxList<User>(
                  contentList: userList,
                  checkBoxType: CheckBoxType.title,
                  valueBuilder: (user) => user.name,
                  isSepareated: true,
                  onCheckedListChanged: (isCheckedList) {
                    LoggerService.logDebug("CheckedList: $isCheckedList");
                  },
                ),
              ),
              const SizedBox(height: 48.0),
              SizedBox(
                height: 150,
                child: CheckBoxList<User>(
                  contentList: userList,
                  checkBoxType: CheckBoxType.normal,
                  valueBuilder: (user) => user.name,
                  isSepareated: true,
                  onCheckedListChanged: (isCheckedList) {
                    LoggerService.logDebug("CheckedList: $isCheckedList");
                  },
                ),
              ),
              const SizedBox(height: 48.0),
              SizedBox(
                height: 150,
                child: CheckBoxList<User>(
                  contentList: userList,
                  checkBoxType: CheckBoxType.sub,
                  valueBuilder: (user) => user.name,
                  isSepareated: true,
                  onCheckedListChanged: (isCheckedList) {
                    LoggerService.logDebug("CheckedList: $isCheckedList");
                  },
                ),
              ),
              const SizedBox(height: 48.0),
              const Text(
                '2. 라디오 리스트 컴포넌트',
                style: TextStyles.Body1_Medium,
              ),
              const SizedBox(height: 12.0),
              SizedBox(
                height: 150,
                child: RadioButtonList<User>(
                  contentList: userList,
                  valueBuilder: (user) => user.name,
                  isSepareated: false,
                  onCheckedIndex: (index) {
                    LoggerService.logDebug("onCheckedIndex: $index");
                  },
                ),
              ),
              const SizedBox(height: 48.0),
            ],
          ),
        ),
      ),
    );
  }
}
