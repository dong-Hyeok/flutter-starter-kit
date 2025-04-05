import 'package:flutter/material.dart';

// 정확한 사이즈 측정이 어려움...
// 지정경로에만 사용되서 화면 구현할때 해연님이 직접 사이즈 보시고 수정하는 걸로 결정!
class CustomToggle extends StatefulWidget {
  const CustomToggle({super.key});

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8, // 크기를 조정 (1.0 = 기본 크기)
      child: Switch(
        value: isToggled,
        onChanged: (value) {
          setState(() {
            isToggled = value;
          });
        },
        activeTrackColor: Colors.lightGreenAccent,
        activeColor: Colors.green,
      ),
    );
  }
}
