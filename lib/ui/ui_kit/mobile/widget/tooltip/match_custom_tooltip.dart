import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/match_app_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/tooltip/custom_tooltip_clip.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_text_styles.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_tooltip_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// [MatchCustomTooltip]
///
/// ### 파라미터
/// - [iconWidget]: 툴팁을 호출하기 위해 클릭하는 아이콘 위젯
/// - [subWidget]: iconWidget 왼쪽에 위치하는 위젯
/// - [tooltipText]: 툴팁에 들어갈 내용
/// - [tooltipIcon]: 툴팁에 들어갈 아이콘(우측에 위치)
/// - [matchTooltipStyles]: 툴팁 스타일
class MatchCustomTooltip extends StatefulWidget {
  final Widget iconWidget;
  final Widget? subWidget;
  final String tooltipText;
  final String? tooltipIcon;
  final MatchTooltipStyles matchTooltipStyles;

  const MatchCustomTooltip({
    super.key,
    required this.iconWidget,
    this.subWidget,
    required this.tooltipText,
    this.tooltipIcon,
    required this.matchTooltipStyles,
  });

  @override
  State<MatchCustomTooltip> createState() => _MatchCustomTooltipState();
}

class _MatchCustomTooltipState extends State<MatchCustomTooltip> {
  OverlayEntry? _overlayEntry;
  final GlobalKey _iconKey = GlobalKey(); // 아이콘 키
  final GlobalKey _tooltipKey = GlobalKey(); // 툴팁 키

  @override
  void dispose() {
    _hideTooltip();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showTooltip(context), // 클릭 시 툴팁 표시
      child: IntrinsicWidth(
        child: Row(
          children: [
            if (widget.subWidget != null) ...{widget.subWidget!},
            Container(key: _iconKey, child: widget.iconWidget),
          ],
        ),
      ),
    );
  }

  /// 툴팁 표시
  /// 1. 처음은 투명하게 표시해서 툴팁 사이즈 측정 후 지움
  /// 2. 측정한 넓이로 정확한 툴팁 위치 잡고 정상 툴팁 표시
  void _showTooltip(BuildContext context) {
    if (_overlayEntry != null) return; // 이미 표시 중이면 무시

    final overlay = Overlay.of(context);

    // 아이콘 위치와 크기 가져오기
    final RenderBox iconRenderBox = _iconKey.currentContext!.findRenderObject() as RenderBox;
    final targetSize = iconRenderBox.size;
    final targetPosition = iconRenderBox.localToGlobal(Offset.zero);
    final topPosition = _getTooltipTopPosition(targetPosition, targetSize);

    // 처음엔 투명으로 표시
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              left: targetPosition.dx,
              top: targetPosition.dy + targetSize.height + 4,
              child: Opacity(
                opacity: 0.0, // 초기엔 보이지 않게
                child: tooltipWidget(),
              ),
            ),
          ],
        );
      },
    );

    overlay.insert(_overlayEntry!);

    /// 툴팁 바인딩시 툴팁 넓이 얻기
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox tooltipRenderBox =
          _tooltipKey.currentContext?.findRenderObject() as RenderBox;
      final tooltipWidth = tooltipRenderBox.size.width;

      _overlayEntry?.remove();

      _overlayEntry = OverlayEntry(
        builder: (context) {
          return Stack(
            children: [
              // 배경을 터치하면 툴팁 닫힘
              Positioned.fill(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: _hideTooltip,
                ),
              ),
              // 아이콘 바로 아래에 툴팁 배치
              Positioned(
                left: targetPosition.dx - (tooltipWidth / 2) + (targetSize.width / 2), // 아이콘의 X 좌표
                top: topPosition,
                child: tooltipWidget(),
              ),
            ],
          );
        },
      );

      overlay.insert(_overlayEntry!);
    });
  }

  double _getTooltipTopPosition(Offset targetPosition, Size targetSize) {
    var topPosi = 0.0;

    switch (widget.matchTooltipStyles) {
      case MatchTooltipStyles.START_BOTTOM:
        break;

      case MatchTooltipStyles.CENTER_BOTTOM:
        topPosi = targetPosition.dy + targetSize.height + 2;
        break;

      case MatchTooltipStyles.END_BOTTOM:
        break;

      case MatchTooltipStyles.START_TOP:
        break;

      case MatchTooltipStyles.CENTER_TOP:
        topPosi = targetPosition.dy - (targetSize.height + 10);
        break;

      case MatchTooltipStyles.END_TOP:
        break;
    }

    return topPosi;
  }

  /// 툴팁 숨기기
  void _hideTooltip() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  EdgeInsets getPaddingType() {
    if (widget.matchTooltipStyles == MatchTooltipStyles.START_TOP ||
        widget.matchTooltipStyles == MatchTooltipStyles.CENTER_TOP ||
        widget.matchTooltipStyles == MatchTooltipStyles.END_TOP) {
      return const EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 8);
    } else {
      return const EdgeInsets.only(left: 4, right: 4, top: 8, bottom: 2);
    }
  }

  /// 커스텀 툴팁 위젯
  Widget tooltipWidget() {
    return ClipPath(
      clipper: CustomTooltipClip(tooltipStyles: widget.matchTooltipStyles),
      child: Container(
        key: _tooltipKey,
        color: MatchAppColors.interactionColors.interactionTransparentDark,
        padding: getPaddingType(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            DefaultTextStyle(
              style: MatchTextStyles.Body3_Regular.copyWith(
                color: MatchAppColors.textColors.textInverse_D,
              ),
              child: Text(widget.tooltipText),
            ),
            if (widget.tooltipIcon != null) ...{
              SvgPicture.asset(widget.tooltipIcon!),
            },
          ],
        ),
      ),
    );
  }
}
