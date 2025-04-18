import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/text_styles.dart';

enum DefaultBadgeStyle {
  Small(height: 16.0, paddingHorizontal: 6.0, textStyle: TextStyles.Label4),
  Medium(height: 24.0, paddingHorizontal: 8.0, textStyle: TextStyles.Label2);

  final double height;
  final double paddingHorizontal;
  final TextStyle textStyle;

  const DefaultBadgeStyle({
    required this.height,
    required this.paddingHorizontal,
    required this.textStyle,
  });
}
