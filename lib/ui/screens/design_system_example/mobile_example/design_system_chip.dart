import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/asset_path/icon_path.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/component/chip_components/medium_chip_list.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/chip/default_chip.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/chip/medium_chip.dart';
import 'package:flutter_starter_kit/ui/ui_kit/mobile/widget/chip/small_chip.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/custom_chip_styles.dart';
import 'package:flutter_starter_kit/ui/ui_kit/style/text_styles.dart';


class DesignSystemChip extends StatefulWidget {
  const DesignSystemChip({super.key});

  @override
  State<DesignSystemChip> createState() => _DesignSystemChipState();
}

class _DesignSystemChipState extends State<DesignSystemChip> {
  List<String> titles = [
    'Chip 1',
    'Chip 2',
    'Chip 3',
    'Chip 4',
    'Chip 5',
    'Chip 6',
    'Chip 7'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chip")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '1. Default Chip',
              style: TextStyles.Body1_Medium,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DefaultChip(title: '상차대기(6)'),
                DefaultChip(
                  title: '상차대기(6)',
                  assetName: IconPath.iconCircleQuestion,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DefaultChip(
                  title: '상차대기(6)',
                  isActive: false,
                ),
                DefaultChip(
                  title: '상차대기(6)',
                  isActive: false,
                  assetName: IconPath.iconCircleQuestion,
                  assetPosition: ChipIconPosition.RIGHT,
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              '2. Medium Chip',
              style: TextStyles.Body1_Medium,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MediumChip(
                  title: '라벨',
                ),
                MediumChip(
                  title: '라벨',
                  assetName: IconPath.iconCircleQuestion,
                  assetPosition: ChipIconPosition.LEFT,
                ),
                MediumChip(
                  title: '라벨',
                  assetName: IconPath.iconCircleQuestion,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MediumChip(
                  title: '라벨',
                  isActive: false,
                ),
                MediumChip(
                  title: '라벨',
                  assetName: IconPath.iconCircleQuestion,
                  assetPosition: ChipIconPosition.LEFT,
                  isActive: false,
                ),
                MediumChip(
                  title: '라벨',
                  assetName: IconPath.iconCircleQuestion,
                  isActive: false,
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              '3. Small Chip',
              style: TextStyles.Body1_Medium,
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SmallChip(
                  title: '라벨',
                ),
                SmallChip(
                  title: '라벨',
                  assetName: IconPath.iconCircleQuestion,
                ),
                SmallChip(
                  title: '라벨',
                  assetName: IconPath.iconCircleQuestion,
                  assetPosition: ChipIconPosition.LEFT,
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              '3. Medium Chip List',
              style: TextStyles.Body1_Medium,
            ),
            const SizedBox(height: 8),
            MediumChipList(
              titles: titles,
              onIconTap: (int index) {
                setState(() {
                  titles.removeAt(index); // index를 기반으로 삭제
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
