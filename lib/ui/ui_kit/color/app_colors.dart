import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/fill_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/icon_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/interaction_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/stroke_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/text_colors.dart';

class AppColors {
  static late TextColors textColors;
  static late IconColors iconColors;
  static late FillColors fillColors;
  static late StrokeColors strokeColors;
  static late InteractionColors interactionColors;

  static void initialize(BuildContext context) {
    textColors = Theme.of(context).extension<TextColors>()!;
    iconColors = Theme.of(context).extension<IconColors>()!;
    fillColors = Theme.of(context).extension<FillColors>()!;
    strokeColors = Theme.of(context).extension<StrokeColors>()!;
    interactionColors = Theme.of(context).extension<InteractionColors>()!;
  }
}
