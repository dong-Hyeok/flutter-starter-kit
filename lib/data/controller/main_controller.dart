import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/logger/app_logger';
import 'package:get/get.dart';

class MainController extends GetxController {
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;

  void toggleTheme() {
    LoggerService.logDebug('테마 변경 메서드 실행');
    if (themeMode.value == ThemeMode.light) {
      themeMode.value = ThemeMode.dark;
    } else {
      themeMode.value = ThemeMode.light;
    }

    update();
  }
}
