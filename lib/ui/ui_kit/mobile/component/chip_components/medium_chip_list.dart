import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/asset_path/icon_path.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/chip/medium_chip.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/match_chip_styles.dart';

class MediumChipList extends StatelessWidget {
  final List<String> titles;
  final String? assetName; // 아이콘 이름 (close 아이콘 디폴트)
  final ChipIconPosition assetPosition; // 아이콘 위치
  final Function(int index)? onIconTap; // Chip 삭제 콜백 (index 기반)

  const MediumChipList({
    required this.titles,
    this.assetName = IconPath.iconClose,
    this.assetPosition = ChipIconPosition.RIGHT,
    this.onIconTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // 칩 수평 간격
      runSpacing: 8.0, // 칩 수직 간격
      children: List.generate(titles.length, (index) {
        return MediumChip(
          title: titles[index],
          assetName: assetName,
          assetPosition: assetPosition,
          onIconTap: () {
            if (onIconTap != null) {
              onIconTap!(index);
            }
          },
        );
      }),
    );
  }
}
