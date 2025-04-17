import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/data/controller/main_controller.dart';
import 'package:flutter_starter_kit/ui/screens/home/home_screen.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/app_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/theme/app_theme.dart';
import 'package:get/get.dart';

void main() async {
  await initializeApp();
  runApp(const StartApp());
}

Future<void> initializeApp() async {
  Get.put(MainController());
}

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  Future<void> _initializeApp(BuildContext context) async {
  
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (mainController) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mainController.themeMode.value,
          home: FutureBuilder<void>(
            future: _initializeApp(context),
            builder: (context, snapshot) {
              AppColors.initialize(context);

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(body: Center(child: CircularProgressIndicator()));
              } else if (snapshot.hasError) {
                return const Scaffold(body: Center(child: Text('초기화 에러')));
              } else {
                return const HomeScreen();
              }
            },
          ),
        );
      },
    );
  }
}
