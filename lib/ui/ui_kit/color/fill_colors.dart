import 'package:flutter/material.dart';

class FillColors extends ThemeExtension<FillColors> {
  final Color fillDefault;
  final Color fillDefault_D;
  final Color fillDefault_D2;
  final Color fillStrong;
  final Color fillSoft;
  final Color fillSoft_D;
  final Color fillSoft2;
  final Color fillSoft2_D;
  final Color fillDisabled;
  final Color fillPrimarySoft;
  final Color fillDisabledSoft;
  final Color fillPrimary;
  final Color fillPrimary_D;
  final Color fillSecondary;
  final Color fillRedSoft;
  final Color fillRed;
  final Color fillOrangeSoft;
  final Color fillOrange;
  final Color fillGreenSoft;
  final Color fillGreen;
  final Color fillBlueSoft;
  final Color fillBlue;
  final Color fillPurpleSoft;
  final Color fillError;

  FillColors({
    required this.fillDefault,
    required this.fillDefault_D,
    required this.fillDefault_D2,
    required this.fillStrong,
    required this.fillSoft,
    required this.fillSoft_D,
    required this.fillSoft2,
    required this.fillSoft2_D,
    required this.fillDisabled,
    required this.fillPrimarySoft,
    required this.fillDisabledSoft,
    required this.fillPrimary,
    required this.fillPrimary_D,
    required this.fillSecondary,
    required this.fillRedSoft,
    required this.fillRed,
    required this.fillOrangeSoft,
    required this.fillOrange,
    required this.fillGreenSoft,
    required this.fillGreen,
    required this.fillBlueSoft,
    required this.fillBlue,
    required this.fillPurpleSoft,
    required this.fillError,
  });

  @override
  FillColors copyWith({
    Color? fillDefault,
    Color? fillDefault_D,
    Color? fillDefault_D2,
    Color? fillStrong,
    Color? fillSoft,
    Color? fillSoft_D,
    Color? fillSoft2,
    Color? fillSoft2_D,
    Color? fillDisabled,
    Color? fillPrimarySoft,
    Color? fillDisabledSoft,
    Color? fillPrimary,
    Color? fillPrimary_D,
    Color? fillSecondary,
    Color? fillRedSoft,
    Color? fillRed,
    Color? fillOrangeSoft,
    Color? fillOrange,
    Color? fillGreenSoft,
    Color? fillGreen,
    Color? fillBlueSoft,
    Color? fillBlue,
    Color? fillPurpleSoft,
    Color? fillError,
  }) {
    return FillColors(
      fillDefault: fillDefault ?? this.fillDefault,
      fillDefault_D: fillDefault_D ?? this.fillDefault_D,
      fillDefault_D2: fillDefault_D2 ?? this.fillDefault_D2,
      fillStrong: fillStrong ?? this.fillStrong,
      fillSoft: fillSoft ?? this.fillSoft,
      fillSoft_D: fillSoft_D ?? this.fillSoft_D,
      fillSoft2: fillSoft2 ?? this.fillSoft2,
      fillSoft2_D: fillSoft2_D ?? this.fillSoft2_D,
      fillDisabled: fillDisabled ?? this.fillDisabled,
      fillPrimarySoft: fillPrimarySoft ?? this.fillPrimarySoft,
      fillDisabledSoft: fillDisabledSoft ?? this.fillDisabledSoft,
      fillPrimary: fillPrimary ?? this.fillPrimary,
      fillPrimary_D: fillPrimary_D ?? this.fillPrimary_D,
      fillSecondary: fillSecondary ?? this.fillSecondary,
      fillRedSoft: fillRedSoft ?? this.fillRedSoft,
      fillRed: fillRed ?? this.fillRed,
      fillOrangeSoft: fillOrangeSoft ?? this.fillOrangeSoft,
      fillOrange: fillOrange ?? this.fillOrange,
      fillGreenSoft: fillGreenSoft ?? this.fillGreenSoft,
      fillGreen: fillGreen ?? this.fillGreen,
      fillBlueSoft: fillBlueSoft ?? this.fillBlueSoft,
      fillBlue: fillBlue ?? this.fillBlue,
      fillPurpleSoft: fillPurpleSoft ?? this.fillPurpleSoft,
      fillError: fillError ?? this.fillError,
    );
  }

  @override
  FillColors lerp(ThemeExtension<FillColors>? other, double t) {
    if (other is! FillColors) return this;
    return FillColors(
      fillDefault: Color.lerp(fillDefault, other.fillDefault, t)!,
      fillDefault_D: Color.lerp(fillDefault_D, other.fillDefault_D, t)!,
      fillDefault_D2: Color.lerp(fillDefault_D2, other.fillDefault_D2, t)!,
      fillStrong: Color.lerp(fillStrong, other.fillStrong, t)!,
      fillSoft: Color.lerp(fillSoft, other.fillSoft, t)!,
      fillSoft_D: Color.lerp(fillSoft_D, other.fillSoft_D, t)!,
      fillSoft2: Color.lerp(fillSoft2, other.fillSoft2, t)!,
      fillSoft2_D: Color.lerp(fillSoft2_D, other.fillSoft2_D, t)!,
      fillDisabled: Color.lerp(fillDisabled, other.fillDisabled, t)!,
      fillPrimarySoft: Color.lerp(fillPrimarySoft, other.fillPrimarySoft, t)!,
      fillDisabledSoft: Color.lerp(fillDisabledSoft, other.fillDisabledSoft, t)!,
      fillPrimary: Color.lerp(fillPrimary, other.fillPrimary, t)!,
      fillPrimary_D: Color.lerp(fillPrimary_D, other.fillPrimary_D, t)!,
      fillSecondary: Color.lerp(fillSecondary, other.fillSecondary, t)!,
      fillRedSoft: Color.lerp(fillRedSoft, other.fillRedSoft, t)!,
      fillRed: Color.lerp(fillRed, other.fillRed, t)!,
      fillOrangeSoft: Color.lerp(fillOrangeSoft, other.fillOrangeSoft, t)!,
      fillOrange: Color.lerp(fillOrangeSoft, other.fillOrange, t)!,
      fillGreenSoft: Color.lerp(fillGreenSoft, other.fillGreenSoft, t)!,
      fillGreen: Color.lerp(fillGreen, other.fillGreen, t)!,
      fillBlueSoft: Color.lerp(fillBlueSoft, other.fillBlueSoft, t)!,
      fillBlue: Color.lerp(fillBlue, other.fillBlue, t)!,
      fillPurpleSoft: Color.lerp(fillPurpleSoft, other.fillPurpleSoft, t)!,
      fillError: Color.lerp(fillError, other.fillError, t)!,
    );
  }
}
