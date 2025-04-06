import 'package:flutter/cupertino.dart';

Widget bottomSheetDragHandle() {
  return SizedBox(
    width: double.infinity,
    child: Center(
      child: Container(
        width: 40,
        height: 6,
        decoration: BoxDecoration(
          color: const Color(0xFFEDEDED),
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    ),
  );
}
