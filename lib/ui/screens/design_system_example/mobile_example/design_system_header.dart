import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/component/appbar_components/custom_appbar.dart';

class DesignSystemHeader extends StatelessWidget {
  const DesignSystemHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "설정",
        onRightIconPressed: () {},
        isBackground: true,
      ),
      body: const Center(child: Text("Header")),
    );
  }
}
