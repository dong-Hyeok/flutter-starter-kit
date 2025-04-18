import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/asset_path/icon_path.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/app_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/floating_medium_primary_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/large_primary_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/large_secondary_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/link_medium_primary_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/link_medium_secondary_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/link_micro_secondary_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/link_micro_sub_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/medium_primary_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/medium_secondary_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/micro_color_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/micro_outline_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/micro_secondary_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/message/toast_message.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/custom_button_styles.dart';

class DesignSystemButton extends StatelessWidget {
  const DesignSystemButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                LargePrimaryButton(
                  title: '(L)Primary',
                  assetName: IconPath.iconCircleQuestion,
                  assetPosition: ButtonIconPosition.RIGHT,
                  onTap: () => ToastMessage.defaultToast(message: '버튼 클릭'),
                ),
                const SizedBox(height: 24),
                LargePrimaryButton(
                  title: '(L)Primary (Full)',
                  widthOption: ButtonWidthOption.FULL,
                  onTap: () => ToastMessage.defaultToast(message: '버튼 클릭'),
                ),
                const SizedBox(height: 24),
                LargePrimaryButton(
                  title: '(L)Primary (CUSTOM)',
                  widthOption: ButtonWidthOption.CUSTOM,
                  customWidth: 300,
                  onTap: () => ToastMessage.defaultToast(message: '버튼 클릭'),
                ),
                const SizedBox(height: 24),
                LargeSecondaryButton(
                  title: '(L)Secondary',
                  assetName: IconPath.iconCircleQuestion,
                  assetPosition: ButtonIconPosition.RIGHT,
                  onTap: () => ToastMessage.defaultToast(message: '버튼 클릭'),
                ),
                const SizedBox(height: 24),
                LargeSecondaryButton(
                  title: '(L)Secondary (Full)',
                  widthOption: ButtonWidthOption.FULL,
                  onTap: () => ToastMessage.defaultToast(message: '버튼 클릭'),
                ),
                const SizedBox(height: 24),
                LargeSecondaryButton(
                  title: '(L)Secondary disable',
                  isEnable: false,
                  widthOption: ButtonWidthOption.FULL,
                  onTap: () => ToastMessage.defaultToast(message: '버튼 클릭'),
                ),
                const SizedBox(height: 24),
                MediumPrimaryButton(
                  title: '(MD)Pirmary',
                  widthOption: ButtonWidthOption.WRAP,
                  onTap: () => ToastMessage.defaultToast(message: '버튼 클릭'),
                ),
                const SizedBox(height: 24),
                MediumSecondaryButton(
                  title: '(MD)Secondary',
                  widthOption: ButtonWidthOption.WRAP,
                  onTap: () => ToastMessage.defaultToast(message: '버튼 클릭'),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MicroColorButton(
                      title: '(MC)Color',
                      widthOption: ButtonWidthOption.WRAP,
                      backgroundColor: AppColors.fillColors.fillOrange,
                      onTap: () => ToastMessage.defaultToast(message: '버튼 클릭'),
                    ),
                    MicroColorButton(
                      title: '(MC)Color',
                      widthOption: ButtonWidthOption.WRAP,
                      backgroundColor: AppColors.fillColors.fillError,
                      onTap: () => ToastMessage.defaultToast(message: '버튼 클릭'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MicroSecondaryButton(
                      title: '(MC)Secondary',
                      widthOption: ButtonWidthOption.WRAP,
                      onTap: () => ToastMessage.defaultToast(message: '버튼 클릭'),
                    ),
                    MicroSecondaryButton(
                      title: '(MC)Secondary disable',
                      widthOption: ButtonWidthOption.WRAP,
                      isEnable: false,
                      onTap: () => ToastMessage.defaultToast(message: '버튼 클릭'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                MicroOutlineButton(
                  title: '(MC)Outline',
                  widthOption: ButtonWidthOption.WRAP,
                  onTap: () => ToastMessage.defaultToast(message: '버튼 클릭'),
                ),
                const SizedBox(height: 24),
                LinkMediumPrimaryButton(
                  title: '(Link)Medium Pirmary',
                  widthOption: ButtonWidthOption.WRAP,
                  onTap: () => ToastMessage.defaultToast(message: '버튼 클릭'),
                ),
                const SizedBox(height: 24),
                LinkMediumSecondaryButton(
                  title: '(Link)Medium Secondary',
                  widthOption: ButtonWidthOption.WRAP,
                  onTap: () => ToastMessage.defaultToast(message: '버튼 클릭'),
                ),
                const SizedBox(height: 24),
                LinkMicroSecondaryButton(
                  title: '(Link)Micro Secondary',
                  widthOption: ButtonWidthOption.WRAP,
                  onTap: () => ToastMessage.defaultToast(message: '버튼 클릭'),
                ),
                const SizedBox(height: 24),
                LinkMicroSubButton(
                  title: '(Link)Micro Sub',
                  onTap: () => ToastMessage.defaultToast(message: '버튼 클릭'),
                ),
                const SizedBox(height: 24),
                FloatingMediumPrimaryButton(
                  title: 'Floating',
                  widthOption: ButtonWidthOption.WRAP,
                  onTap: () => ToastMessage.defaultToast(message: '버튼 클릭'),
                ),
                const SizedBox(height: 24),
                FloatingMediumPrimaryButton(
                  title: 'Floating',
                  widthOption: ButtonWidthOption.WRAP,
                  assetName: IconPath.iconCircleQuestion,
                  onTap: () => ToastMessage.defaultToast(message: '버튼 클릭'),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
