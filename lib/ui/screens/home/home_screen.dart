import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/ui/screens/home/desktop_home_screen.dart';
import 'package:flutter_starter_kit/ui/screens/home/mobile_home_screen.dart';
import 'dart:io' show Platform;

import 'package:flutter_starter_kit/ui/screens/home/web_home_screen.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AppColors.initialize(context);

    if (kIsWeb) {
      return const WebHomeScreen();
    } else if (Platform.isAndroid || Platform.isIOS) {
      return const MobileHomeScreen();
    } else if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      return const DesktopHomeScreen();
    } else {
      return const Scaffold(body: Center(child: Text('Unknown Platform')));
    }
  }
}
