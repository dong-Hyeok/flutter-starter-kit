import 'package:flutter/material.dart';

Widget topBorderDivider({
  double height = 8,
  Color color = const Color(0xFFF3F4F6),
  Color topBorderColor = const Color(0xFFE8EAED),
  double borderWidth = 1,
}) {
  return Container(
    decoration: BoxDecoration(color: color, border: Border(top: BorderSide(color: topBorderColor, width: borderWidth))),
    height: height,
    width: double.infinity,
  );
}
