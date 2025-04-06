import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/ui/screens/design_system_example/mobile_example/design_system_home.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/component/header_components/match_header.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/button/large_primary_button.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_button_styles.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MatchAppbar(title: 'Mobile Home'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            LargePrimaryButton(
              title: 'Chip',
              widthOption: ButtonWidthOption.FULL,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DesignSystemHome()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
