import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/fill_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/icon_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/interaction_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/match_colors_dark.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/match_colors_light.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/stroke_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/text_colors.dart';

class AppTheme {
  // 라이트 테마
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    // ------------- 수정 필요 --------------
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: MatchColorsLight.commonWhite,
    canvasColor: Colors.white,
    appBarTheme: const AppBarTheme(backgroundColor: MatchColorsLight.primaryDefault, foregroundColor: Colors.white),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: MatchColorsLight.primaryDefault, // 커서 색상
      selectionColor: MatchColorsLight.primaryDefault, // 선택된 텍스트 배경 색상
      selectionHandleColor: MatchColorsLight.primaryDefault, // 텍스트 선택 핸들러(물방울) 색상
    ),
    // -----------------------------------
    extensions: <ThemeExtension<dynamic>>[
      TextColors(
        textDefault: MatchColorsLight.coolNeutral700,
        textStrong: MatchColorsLight.coolNeutral800,
        textSoft: MatchColorsLight.coolNeutral500,
        textHelper: MatchColorsLight.coolNeutral400,
        textPlaceholder: MatchColorsLight.coolNeutral300,
        textDisabled: MatchColorsLight.neutral400,
        textInverse: MatchColorsLight.commonWhite,
        textInverse_D: MatchColorsLight.commonWhite,
        textActive: MatchColorsLight.systemFocus,
        textPrimary: MatchColorsLight.primaryDefault_D,
        textError: MatchColorsLight.systemError,
        textRed: MatchColorsLight.systemRedStrong,
        textOrange: MatchColorsLight.systemOrangeStrong,
        textGreen: MatchColorsLight.systemGreenStrong,
        textBlue: MatchColorsLight.systemBlueStrong,
        textPurple: MatchColorsLight.systemPurpleStrong,
      ),
      IconColors(
        iconStrong: MatchColorsLight.coolNeutral800,
        iconDefault: MatchColorsLight.coolNeutral600,
        iconSoft: MatchColorsLight.coolNeutral400,
        iconActive: MatchColorsLight.systemFocus,
        iconDisabled: MatchColorsLight.neutral300,
        iconDisabledSoft: MatchColorsLight.neutral200,
        iconInverse: MatchColorsLight.commonWhite,
        iconInverse_D: MatchColorsLight.commonWhite,
        iconPrimary: MatchColorsLight.primaryDefault,
        iconError: MatchColorsLight.systemError,
        iconRed: MatchColorsLight.systemRedStrong,
        iconOrange: MatchColorsLight.systemOrangeStrong,
        iconGreen: MatchColorsLight.systemGreenStrong,
        iconBlue: MatchColorsLight.systemBlueStrong,
        iconPurple: MatchColorsLight.systemPurpleStrong,
      ),
      FillColors(
        fillDefault: MatchColorsLight.commonWhite,
        fillDefault_D: MatchColorsLight.commonWhite,
        fillDefault_D2: MatchColorsLight.commonWhite,
        fillStrong: MatchColorsLight.coolNeutral800,
        fillSoft: MatchColorsLight.coolNeutral50,
        fillSoft_D: MatchColorsLight.coolNeutral50,
        fillSoft2: MatchColorsLight.coolNeutral000,
        fillSoft2_D: MatchColorsLight.coolNeutral000,
        fillDisabled: MatchColorsLight.neutral200,
        fillPrimarySoft: MatchColorsLight.primarySoft,
        fillDisabledSoft: MatchColorsLight.neutral100,
        fillPrimary: MatchColorsLight.primaryDefault,
        fillPrimary_D: MatchColorsLight.primaryDefault,
        fillSecondary: MatchColorsLight.coolNeutral50,
        fillRedSoft: MatchColorsLight.systemRedSoft,
        fillRed: MatchColorsLight.systemRedStrong,
        fillOrangeSoft: MatchColorsLight.systemOrangeSoft,
        fillOrange: MatchColorsLight.systemOrangeStrong,
        fillGreenSoft: MatchColorsLight.systemGreenSoft,
        fillGreen: MatchColorsLight.systemGreenStrong,
        fillBlueSoft: MatchColorsLight.systemBlueSoft,
        fillBlue: MatchColorsLight.systemBlueStrong,
        fillPurpleSoft: MatchColorsLight.systemPurpleSoft,
        fillError: MatchColorsLight.systemError,
      ),
      StrokeColors(
        strokeDefault: MatchColorsLight.neutral100,
        strokeStrong: MatchColorsLight.coolNeutral500,
        strokeSoft: MatchColorsLight.coolNeutral50,
        strokeSoft_D: MatchColorsLight.coolNeutral50,
        strokePrimary: MatchColorsLight.primaryDefault_D,
        strokeFocus: MatchColorsLight.systemFocus,
        strokeDisabled: MatchColorsLight.neutral200,
        strokeError: MatchColorsLight.systemError,
        strokeInverse: MatchColorsLight.commonWhite,
      ),
      InteractionColors(
        interactionDimmed: const Color(0xFF171719).withValues(alpha: (0.52 * 255).round().toDouble()),
        interactionDimmed_D: const Color(0xFF171719).withValues(alpha: (0.52 * 255).round().toDouble()),
        interactionPressed: const Color(0xFF171719).withValues(alpha: (0.08 * 255).round().toDouble()),
        interactionPressedInverse: const Color(0xFFFFFFFF).withValues(alpha: (0.12 * 255).round().toDouble()),
        interactionTransparentDark: const Color(0xFF474747).withValues(alpha: (0.96 * 255).round().toDouble()),
        interactionLinkPressedInverse: const Color(0xFFFFFFFF).withValues(alpha: (0.24 * 255).round().toDouble()),
      ),
    ],
  );

  // 다크 테마 (Todo 색상 픽스되면 수정해야함)
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    // ------------- 수정 필요 --------------
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: MatchColorsDark.commonWhite,
    canvasColor: Colors.white,
    // AppBar
    appBarTheme: const AppBarTheme(backgroundColor: MatchColorsDark.coolNeutral50, foregroundColor: Colors.white),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: MatchColorsDark.primaryDefault, // 커서 색상
      selectionColor: MatchColorsDark.primaryDefault, // 선택된 텍스트 배경 색상
      selectionHandleColor: MatchColorsDark.primaryDefault, // 텍스트 선택 핸들러(물방울) 색상
    ),
    // -----------------------------------
    extensions: <ThemeExtension<dynamic>>[
      TextColors(
        textDefault: MatchColorsDark.coolNeutral800,
        textStrong: MatchColorsDark.commonBlack,
        textSoft: MatchColorsDark.coolNeutral500,
        textHelper: MatchColorsDark.coolNeutral400,
        textPlaceholder: MatchColorsDark.coolNeutral300,
        textDisabled: MatchColorsDark.neutral400,
        textInverse: MatchColorsDark.commonWhite,
        textInverse_D: MatchColorsDark.commonBlack,
        textActive: MatchColorsDark.systemFocus,
        textPrimary: MatchColorsDark.primaryDefault_D,
        textError: MatchColorsDark.systemError,
        textRed: MatchColorsDark.systemRedStrong,
        textOrange: MatchColorsDark.systemOrangeStrong,
        textGreen: MatchColorsDark.systemGreenStrong,
        textBlue: MatchColorsDark.systemBlueStrong,
        textPurple: MatchColorsDark.systemPurpleStrong,
      ),
      IconColors(
        iconDefault: MatchColorsDark.coolNeutral600,
        iconStrong: MatchColorsDark.coolNeutral800,
        iconSoft: MatchColorsDark.coolNeutral400,
        iconDisabled: MatchColorsDark.neutral100,
        iconDisabledSoft: MatchColorsDark.neutral200,
        iconInverse: MatchColorsDark.commonWhite,
        iconInverse_D: MatchColorsDark.commonBlack,
        iconPrimary: MatchColorsDark.primaryDefault,
        iconActive: MatchColorsDark.systemFocus,
        iconRed: MatchColorsDark.systemRedStrong,
        iconOrange: MatchColorsDark.systemOrangeStrong,
        iconGreen: MatchColorsDark.systemGreenStrong,
        iconBlue: MatchColorsDark.systemBlueStrong,
        iconPurple: MatchColorsDark.systemPurpleStrong,
        iconError: MatchColorsDark.systemError,
      ),
      FillColors(
        fillDefault: MatchColorsDark.commonWhite,
        fillDefault_D: MatchColorsDark.coolNeutral50,
        fillDefault_D2: MatchColorsDark.coolNeutral100,
        fillStrong: MatchColorsDark.coolNeutral200,
        fillSoft: MatchColorsDark.coolNeutral50,
        fillSoft_D: MatchColorsDark.coolNeutral100,
        fillSoft2: MatchColorsDark.coolNeutral000,
        fillSoft2_D: MatchColorsDark.coolNeutral100,
        fillDisabled: MatchColorsDark.coolNeutral50,
        fillPrimarySoft: MatchColorsDark.primarySoft,
        fillDisabledSoft: MatchColorsDark.neutral100,
        fillPrimary: MatchColorsDark.primaryDefault,
        fillPrimary_D: MatchColorsDark.coolNeutral50,
        fillSecondary: MatchColorsDark.coolNeutral100,
        fillRedSoft: MatchColorsDark.systemRedSoft,
        fillRed: MatchColorsDark.systemRedStrong,
        fillOrangeSoft: MatchColorsDark.systemOrangeSoft,
        fillOrange: MatchColorsDark.systemOrangeStrong,
        fillGreenSoft: MatchColorsDark.systemGreenSoft,
        fillGreen: MatchColorsDark.systemGreenStrong,
        fillBlueSoft: MatchColorsDark.systemBlueSoft,
        fillBlue: MatchColorsDark.systemBlueStrong,
        fillPurpleSoft: MatchColorsDark.systemPurpleSoft,
        fillError: MatchColorsDark.systemError,
      ),
      StrokeColors(
        strokeDefault: MatchColorsDark.neutral100,
        strokeStrong: MatchColorsDark.coolNeutral500,
        strokeSoft: MatchColorsDark.coolNeutral50,
        strokeSoft_D: MatchColorsDark.coolNeutral100,
        strokePrimary: MatchColorsDark.primaryDefault_D,
        strokeFocus: MatchColorsDark.systemFocus,
        strokeDisabled: MatchColorsDark.neutral200,
        strokeError: MatchColorsDark.systemError,
        strokeInverse: MatchColorsDark.commonWhite,
      ),
      InteractionColors(
        interactionDimmed: const Color(0xFF000000).withValues(alpha: (0.80 * 255).round().toDouble()),
        interactionDimmed_D: const Color(0xFFFFFFFF).withValues(alpha: (0.20 * 255).round().toDouble()),
        interactionPressed: const Color(0xFF171719).withValues(alpha: (0.08 * 255).round().toDouble()),
        interactionPressedInverse: const Color(0xFFFFFFFF).withValues(alpha: (0.12 * 255).round().toDouble()),
        interactionTransparentDark: const Color(0xFF474747).withValues(alpha: (0.96 * 255).round().toDouble()),
        interactionLinkPressedInverse: const Color(0xFFFFFFFF).withValues(alpha: (0.24 * 255).round().toDouble()),
      ),
    ],
  );
}
