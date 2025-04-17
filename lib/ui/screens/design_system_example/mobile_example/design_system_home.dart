import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/data/controller/main_controller.dart';
import 'package:flutter_starter_kit/ui/screens/design_system_example/mobile_example/design_system_badge.dart';
import 'package:flutter_starter_kit/ui/screens/design_system_example/mobile_example/design_system_bottom_sheet.dart';
import 'package:flutter_starter_kit/ui/screens/design_system_example/mobile_example/design_system_button.dart';
import 'package:flutter_starter_kit/ui/screens/design_system_example/mobile_example/design_system_chip.dart';
import 'package:flutter_starter_kit/ui/screens/design_system_example/mobile_example/design_system_control.dart';
import 'package:flutter_starter_kit/ui/screens/design_system_example/mobile_example/design_system_header.dart';
import 'package:flutter_starter_kit/ui/screens/design_system_example/mobile_example/design_system_message.dart';
import 'package:flutter_starter_kit/ui/screens/design_system_example/mobile_example/design_system_modal.dart';
import 'package:flutter_starter_kit/ui/screens/design_system_example/mobile_example/design_system_select.dart';
import 'package:flutter_starter_kit/ui/screens/design_system_example/mobile_example/design_system_tab.dart';
import 'package:flutter_starter_kit/ui/screens/design_system_example/mobile_example/design_system_text_field.dart';
import 'package:flutter_starter_kit/ui/screens/design_system_example/mobile_example/design_system_tooltip.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/app_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/large_primary_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_button_styles.dart';
import 'package:get/get.dart';


class DesignSystemHome extends StatelessWidget {
  DesignSystemHome({super.key});

  final mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    // 테마 변경시 컬러 다시 초기화 해야함
    // 앱 테마를 변경하면 화면이 다시 빌드되기 때문에 테마 변경 버튼이 있는 곳에 색상 초기화 부분이 있어도 상관 없음.
    AppColors.initialize(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('디자인 시스템 예시'),
          actions: [
            Obx(() {
              // 테마 상태에 따라 아이콘 변경
              bool isLightTheme =
                  mainController.themeMode.value == ThemeMode.light;
              return IconButton(
                icon: Icon(
                    isLightTheme ? Icons.wb_sunny : Icons.nightlight_round),
                color: isLightTheme ? Colors.yellow : Colors.blue,
                onPressed: mainController.toggleTheme, // 테마 전환 함수 호출
              );
            }),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                verticalDirection: VerticalDirection.down,
                runSpacing: 16,
                children: [
                  LargePrimaryButton(
                    title: 'Button',
                    widthOption: ButtonWidthOption.FULL,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DesignSystemButton()),
                      );
                    },
                  ),
                  LargePrimaryButton(
                    title: 'Tab',
                    widthOption: ButtonWidthOption.FULL,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DesignSystemTab()),
                      );
                    },
                  ),
                  LargePrimaryButton(
                    title: 'Chip',
                    widthOption: ButtonWidthOption.FULL,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DesignSystemChip()),
                      );
                    },
                  ),
                  LargePrimaryButton(
                    title: 'Control',
                    widthOption: ButtonWidthOption.FULL,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DesignSystemControl()),
                      );
                    },
                  ),
                  LargePrimaryButton(
                    title: 'Badge',
                    widthOption: ButtonWidthOption.FULL,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DesignSystemBadge()),
                      );
                    },
                  ),
                  LargePrimaryButton(
                    title: 'Header',
                    widthOption: ButtonWidthOption.FULL,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DesignSystemHeader()),
                      );
                    },
                  ),
                  LargePrimaryButton(
                    title: 'Text Field',
                    widthOption: ButtonWidthOption.FULL,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const DesignSystemTextField()),
                      );
                    },
                  ),
                  LargePrimaryButton(
                    title: 'Message',
                    widthOption: ButtonWidthOption.FULL,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DesignSystemMessage()),
                      );
                    },
                  ),
                  LargePrimaryButton(
                    title: 'Modal',
                    widthOption: ButtonWidthOption.FULL,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DesignSystemModal()),
                      );
                    },
                  ),
                  LargePrimaryButton(
                    title: 'BottomSheet',
                    widthOption: ButtonWidthOption.FULL,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const DesignSystemBottomSheet()),
                      );
                    },
                  ),
                  LargePrimaryButton(
                    title: 'Tooltip',
                    widthOption: ButtonWidthOption.FULL,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DesignSystemTooltip()),
                      );
                    },
                  ),
                  LargePrimaryButton(
                    title: 'Select',
                    widthOption: ButtonWidthOption.FULL,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DesignSystemSelect()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
