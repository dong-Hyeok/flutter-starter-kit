import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/custom_tooltip_styles.dart';

/// CustomTooltipClip 에서 사용하는 툴팁 UI를 그리는 클래스
class CustomTooltipClip extends CustomClipper<Path> {
  final CustomTooltipStyles tooltipStyles;

  CustomTooltipClip({required this.tooltipStyles});

  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double triangleHeight = 6;
    double triangleWidth = 12;
    double trianglePadding = 10;

    Path path = Path();

    // 사각형 그림
    _getRRect(path, height, width, triangleHeight, tooltipStyles);

    // 삼각형을 그림
    _getTrianglePath(path, height, width, triangleHeight, triangleWidth, trianglePadding);

    return path;
  }

  /// [사각형그림] - 타입 두개
  void _getRRect(Path path, double height, double width, double triangleHeight, tooltipStyles) {
    if (tooltipStyles == CustomTooltipStyles.START_TOP ||
        tooltipStyles == CustomTooltipStyles.CENTER_TOP ||
        tooltipStyles == CustomTooltipStyles.END_TOP) {
      path.addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, width, height - triangleHeight), // 높이를 삼각형 높이만큼 줄임
          const Radius.circular(4),
        ),
      );
    } else {
      path.addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, triangleHeight, width, height - triangleHeight),
          const Radius.circular(4),
        ),
      );
    }
  }

  /// [삼각형 그림] - 타입 6개
  void _getTrianglePath(
    Path path,
    double height,
    double width,
    double triangleHeight,
    double triangleWidth,
    double trianglePadding,
  ) {
    switch (tooltipStyles) {
      case CustomTooltipStyles.START_BOTTOM:
        path.moveTo(trianglePadding, triangleHeight); // 삼각형 왼쪽 꼭짓점
        path.lineTo(trianglePadding + triangleWidth / 2, 0); // 삼각형 위쪽 꼭짓점
        path.lineTo(trianglePadding + triangleWidth, triangleHeight); // 삼각형 오른쪽 꼭짓점
        break;

      case CustomTooltipStyles.CENTER_BOTTOM:
        path.moveTo(width / 2 - (triangleWidth / 2), triangleHeight);
        path.lineTo(width / 2, 0);
        path.lineTo(width / 2 + (triangleWidth / 2), triangleHeight);
        break;

      case CustomTooltipStyles.END_BOTTOM:
        path.moveTo(width - (trianglePadding + triangleWidth), triangleHeight);
        path.lineTo(width - (trianglePadding + triangleWidth / 2), 0);
        path.lineTo(width - trianglePadding, triangleHeight);
        break;

      case CustomTooltipStyles.START_TOP:
        path.moveTo(trianglePadding, height - triangleHeight);
        path.lineTo(trianglePadding + triangleWidth / 2, height);
        path.lineTo(trianglePadding + triangleWidth, height - triangleHeight);
        break;

      case CustomTooltipStyles.CENTER_TOP:
        path.moveTo(width / 2 - (triangleWidth / 2), height - triangleHeight);
        path.lineTo(width / 2, height);
        path.lineTo(width / 2 + (triangleWidth / 2), height - triangleHeight);
        break;

      case CustomTooltipStyles.END_TOP:
        path.moveTo(width - (trianglePadding + triangleWidth), height - triangleHeight);
        path.lineTo(width - (trianglePadding + triangleWidth / 2), height);
        path.lineTo(width - trianglePadding, height - triangleHeight);
        break;
    }
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
