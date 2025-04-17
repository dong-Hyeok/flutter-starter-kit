import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/fill_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/icon_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/interaction_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/theme_colors_dark.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/theme_colors_light.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/stroke_colors.dart';
import 'package:flutter_starter_kit/ui/ui_kit/color/text_colors.dart';

class AppTheme {
  // 라이트 테마
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    // ------------- 수정 필요 --------------
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: ThemeColorsLight.commonWhite,
    canvasColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: ThemeColorsLight.primaryDefault,
      foregroundColor: Colors.white,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ThemeColorsLight.primaryDefault, // 커서 색상
      selectionColor: ThemeColorsLight.primaryDefault, // 선택된 텍스트 배경 색상
      selectionHandleColor: ThemeColorsLight.primaryDefault, // 텍스트 선택 핸들러(물방울) 색상
    ),
    // -----------------------------------
    extensions: <ThemeExtension<dynamic>>[
      TextColors(
        textDefault: ThemeColorsLight.coolNeutral700,
        textStrong: ThemeColorsLight.coolNeutral800,
        textSoft: ThemeColorsLight.coolNeutral500,
        textHelper: ThemeColorsLight.coolNeutral400,
        textPlaceholder: ThemeColorsLight.coolNeutral300,
        textDisabled: ThemeColorsLight.neutral400,
        textInverse: ThemeColorsLight.commonWhite,
        textInverse_D: ThemeColorsLight.commonWhite,
        textActive: ThemeColorsLight.systemFocus,
        textPrimary: ThemeColorsLight.primaryDefault_D,
        textError: ThemeColorsLight.systemError,
        textRed: ThemeColorsLight.systemRedStrong,
        textOrange: ThemeColorsLight.systemOrangeStrong,
        textGreen: ThemeColorsLight.systemGreenStrong,
        textBlue: ThemeColorsLight.systemBlueStrong,
        textPurple: ThemeColorsLight.systemPurpleStrong,
      ),
      IconColors(
        iconStrong: ThemeColorsLight.coolNeutral800,
        iconDefault: ThemeColorsLight.coolNeutral600,
        iconSoft: ThemeColorsLight.coolNeutral400,
        iconActive: ThemeColorsLight.systemFocus,
        iconDisabled: ThemeColorsLight.neutral300,
        iconDisabledSoft: ThemeColorsLight.neutral200,
        iconInverse: ThemeColorsLight.commonWhite,
        iconInverse_D: ThemeColorsLight.commonWhite,
        iconPrimary: ThemeColorsLight.primaryDefault,
        iconError: ThemeColorsLight.systemError,
        iconRed: ThemeColorsLight.systemRedStrong,
        iconOrange: ThemeColorsLight.systemOrangeStrong,
        iconGreen: ThemeColorsLight.systemGreenStrong,
        iconBlue: ThemeColorsLight.systemBlueStrong,
        iconPurple: ThemeColorsLight.systemPurpleStrong,
      ),
      FillColors(
        fillDefault: ThemeColorsLight.commonWhite,
        fillDefault_D: ThemeColorsLight.commonWhite,
        fillDefault_D2: ThemeColorsLight.commonWhite,
        fillStrong: ThemeColorsLight.coolNeutral800,
        fillSoft: ThemeColorsLight.coolNeutral50,
        fillSoft_D: ThemeColorsLight.coolNeutral50,
        fillSoft2: ThemeColorsLight.coolNeutral000,
        fillSoft2_D: ThemeColorsLight.coolNeutral000,
        fillDisabled: ThemeColorsLight.neutral200,
        fillPrimarySoft: ThemeColorsLight.primarySoft,
        fillDisabledSoft: ThemeColorsLight.neutral100,
        fillPrimary: ThemeColorsLight.primaryDefault,
        fillPrimary_D: ThemeColorsLight.primaryDefault,
        fillSecondary: ThemeColorsLight.coolNeutral50,
        fillRedSoft: ThemeColorsLight.systemRedSoft,
        fillRed: ThemeColorsLight.systemRedStrong,
        fillOrangeSoft: ThemeColorsLight.systemOrangeSoft,
        fillOrange: ThemeColorsLight.systemOrangeStrong,
        fillGreenSoft: ThemeColorsLight.systemGreenSoft,
        fillGreen: ThemeColorsLight.systemGreenStrong,
        fillBlueSoft: ThemeColorsLight.systemBlueSoft,
        fillBlue: ThemeColorsLight.systemBlueStrong,
        fillPurpleSoft: ThemeColorsLight.systemPurpleSoft,
        fillError: ThemeColorsLight.systemError,
      ),
      StrokeColors(
        strokeDefault: ThemeColorsLight.neutral100,
        strokeStrong: ThemeColorsLight.coolNeutral500,
        strokeSoft: ThemeColorsLight.coolNeutral50,
        strokeSoft_D: ThemeColorsLight.coolNeutral50,
        strokePrimary: ThemeColorsLight.primaryDefault_D,
        strokeFocus: ThemeColorsLight.systemFocus,
        strokeDisabled: ThemeColorsLight.neutral200,
        strokeError: ThemeColorsLight.systemError,
        strokeInverse: ThemeColorsLight.commonWhite,
      ),
      InteractionColors(
        interactionDimmed: const Color(
          0xFF171719,
        ).withValues(alpha: (0.52 * 255).round().toDouble()),
        interactionDimmed_D: const Color(
          0xFF171719,
        ).withValues(alpha: (0.52 * 255).round().toDouble()),
        interactionPressed: const Color(
          0xFF171719,
        ).withValues(alpha: (0.08 * 255).round().toDouble()),
        interactionPressedInverse: const Color(
          0xFFFFFFFF,
        ).withValues(alpha: (0.12 * 255).round().toDouble()),
        interactionTransparentDark: const Color(
          0xFF474747,
        ).withValues(alpha: (0.96 * 255).round().toDouble()),
        interactionLinkPressedInverse: const Color(
          0xFFFFFFFF,
        ).withValues(alpha: (0.24 * 255).round().toDouble()),
      ),
    ],
  );

  // 다크 테마 (Todo 색상 픽스되면 수정해야함)
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    // ------------- 수정 필요 --------------
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: ThemeColorsDark.commonWhite,
    canvasColor: Colors.white,
    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: ThemeColorsDark.coolNeutral50,
      foregroundColor: Colors.white,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ThemeColorsDark.primaryDefault, // 커서 색상
      selectionColor: ThemeColorsDark.primaryDefault, // 선택된 텍스트 배경 색상
      selectionHandleColor: ThemeColorsDark.primaryDefault, // 텍스트 선택 핸들러(물방울) 색상
    ),
    // -----------------------------------
    extensions: <ThemeExtension<dynamic>>[
      TextColors(
        textDefault: ThemeColorsDark.coolNeutral800,
        textStrong: ThemeColorsDark.commonBlack,
        textSoft: ThemeColorsDark.coolNeutral500,
        textHelper: ThemeColorsDark.coolNeutral400,
        textPlaceholder: ThemeColorsDark.coolNeutral300,
        textDisabled: ThemeColorsDark.neutral400,
        textInverse: ThemeColorsDark.commonWhite,
        textInverse_D: ThemeColorsDark.commonBlack,
        textActive: ThemeColorsDark.systemFocus,
        textPrimary: ThemeColorsDark.primaryDefault_D,
        textError: ThemeColorsDark.systemError,
        textRed: ThemeColorsDark.systemRedStrong,
        textOrange: ThemeColorsDark.systemOrangeStrong,
        textGreen: ThemeColorsDark.systemGreenStrong,
        textBlue: ThemeColorsDark.systemBlueStrong,
        textPurple: ThemeColorsDark.systemPurpleStrong,
      ),
      IconColors(
        iconDefault: ThemeColorsDark.coolNeutral600,
        iconStrong: ThemeColorsDark.coolNeutral800,
        iconSoft: ThemeColorsDark.coolNeutral400,
        iconDisabled: ThemeColorsDark.neutral100,
        iconDisabledSoft: ThemeColorsDark.neutral200,
        iconInverse: ThemeColorsDark.commonWhite,
        iconInverse_D: ThemeColorsDark.commonBlack,
        iconPrimary: ThemeColorsDark.primaryDefault,
        iconActive: ThemeColorsDark.systemFocus,
        iconRed: ThemeColorsDark.systemRedStrong,
        iconOrange: ThemeColorsDark.systemOrangeStrong,
        iconGreen: ThemeColorsDark.systemGreenStrong,
        iconBlue: ThemeColorsDark.systemBlueStrong,
        iconPurple: ThemeColorsDark.systemPurpleStrong,
        iconError: ThemeColorsDark.systemError,
      ),
      FillColors(
        fillDefault: ThemeColorsDark.commonWhite,
        fillDefault_D: ThemeColorsDark.coolNeutral50,
        fillDefault_D2: ThemeColorsDark.coolNeutral100,
        fillStrong: ThemeColorsDark.coolNeutral200,
        fillSoft: ThemeColorsDark.coolNeutral50,
        fillSoft_D: ThemeColorsDark.coolNeutral100,
        fillSoft2: ThemeColorsDark.coolNeutral000,
        fillSoft2_D: ThemeColorsDark.coolNeutral100,
        fillDisabled: ThemeColorsDark.coolNeutral50,
        fillPrimarySoft: ThemeColorsDark.primarySoft,
        fillDisabledSoft: ThemeColorsDark.neutral100,
        fillPrimary: ThemeColorsDark.primaryDefault,
        fillPrimary_D: ThemeColorsDark.coolNeutral50,
        fillSecondary: ThemeColorsDark.coolNeutral100,
        fillRedSoft: ThemeColorsDark.systemRedSoft,
        fillRed: ThemeColorsDark.systemRedStrong,
        fillOrangeSoft: ThemeColorsDark.systemOrangeSoft,
        fillOrange: ThemeColorsDark.systemOrangeStrong,
        fillGreenSoft: ThemeColorsDark.systemGreenSoft,
        fillGreen: ThemeColorsDark.systemGreenStrong,
        fillBlueSoft: ThemeColorsDark.systemBlueSoft,
        fillBlue: ThemeColorsDark.systemBlueStrong,
        fillPurpleSoft: ThemeColorsDark.systemPurpleSoft,
        fillError: ThemeColorsDark.systemError,
      ),
      StrokeColors(
        strokeDefault: ThemeColorsDark.neutral100,
        strokeStrong: ThemeColorsDark.coolNeutral500,
        strokeSoft: ThemeColorsDark.coolNeutral50,
        strokeSoft_D: ThemeColorsDark.coolNeutral100,
        strokePrimary: ThemeColorsDark.primaryDefault_D,
        strokeFocus: ThemeColorsDark.systemFocus,
        strokeDisabled: ThemeColorsDark.neutral200,
        strokeError: ThemeColorsDark.systemError,
        strokeInverse: ThemeColorsDark.commonWhite,
      ),
      InteractionColors(
        interactionDimmed: const Color(
          0xFF000000,
        ).withValues(alpha: (0.80 * 255).round().toDouble()),
        interactionDimmed_D: const Color(
          0xFFFFFFFF,
        ).withValues(alpha: (0.20 * 255).round().toDouble()),
        interactionPressed: const Color(
          0xFF171719,
        ).withValues(alpha: (0.08 * 255).round().toDouble()),
        interactionPressedInverse: const Color(
          0xFFFFFFFF,
        ).withValues(alpha: (0.12 * 255).round().toDouble()),
        interactionTransparentDark: const Color(
          0xFF474747,
        ).withValues(alpha: (0.96 * 255).round().toDouble()),
        interactionLinkPressedInverse: const Color(
          0xFFFFFFFF,
        ).withValues(alpha: (0.24 * 255).round().toDouble()),
      ),
    ],
  );
}
