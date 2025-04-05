import 'package:flutter/material.dart';

class TextColors extends ThemeExtension<TextColors> {
  final Color textDefault;
  final Color textStrong;
  final Color textSoft;
  final Color textHelper;
  final Color textPlaceholder;
  final Color textDisabled;
  final Color textInverse;
  final Color textInverse_D;
  final Color textActive;
  final Color textPrimary;
  final Color textError;
  final Color textRed;
  final Color textOrange;
  final Color textGreen;
  final Color textBlue;
  final Color textPurple;

  TextColors({
    required this.textDefault,
    required this.textStrong,
    required this.textSoft,
    required this.textHelper,
    required this.textPlaceholder,
    required this.textDisabled,
    required this.textInverse,
    required this.textInverse_D,
    required this.textActive,
    required this.textPrimary,
    required this.textError,
    required this.textRed,
    required this.textOrange,
    required this.textGreen,
    required this.textBlue,
    required this.textPurple,
  });

  @override
  TextColors copyWith({
    Color? textDefault,
    Color? textStrong,
    Color? textSoft,
    Color? textHelper,
    Color? textPlaceholder,
    Color? textDisabled,
    Color? textInverse,
    Color? textInverse_D,
    Color? textActive,
    Color? textPrimary,
    Color? textError,
    Color? textRed,
    Color? textOrange,
    Color? textGreen,
    Color? textBlue,
    Color? textPurple,
  }) {
    return TextColors(
      textDefault: textDefault ?? this.textDefault,
      textStrong: textStrong ?? this.textStrong,
      textSoft: textSoft ?? this.textSoft,
      textHelper: textHelper ?? this.textHelper,
      textPlaceholder: textPlaceholder ?? this.textPlaceholder,
      textDisabled: textDisabled ?? this.textDisabled,
      textInverse: textInverse ?? this.textInverse,
      textInverse_D: textInverse_D ?? this.textInverse_D,
      textActive: textActive ?? this.textActive,
      textPrimary: textPrimary ?? this.textPrimary,
      textError: textError ?? this.textError,
      textRed: textRed ?? this.textRed,
      textOrange: textOrange ?? this.textOrange,
      textGreen: textGreen ?? this.textGreen,
      textBlue: textBlue ?? this.textBlue,
      textPurple: textPurple ?? this.textPurple,
    );
  }

  @override
  TextColors lerp(ThemeExtension<TextColors>? other, double t) {
    if (other is! TextColors) return this;
    return TextColors(
      textDefault: Color.lerp(textDefault, other.textDefault, t)!,
      textStrong: Color.lerp(textStrong, other.textStrong, t)!,
      textSoft: Color.lerp(textSoft, other.textSoft, t)!,
      textHelper: Color.lerp(textHelper, other.textHelper, t)!,
      textPlaceholder: Color.lerp(textPlaceholder, other.textPlaceholder, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      textInverse: Color.lerp(textInverse, other.textInverse, t)!,
      textInverse_D: Color.lerp(textInverse_D, other.textInverse_D, t)!,
      textActive: Color.lerp(textActive, other.textActive, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textError: Color.lerp(textError, other.textError, t)!,
      textRed: Color.lerp(textRed, other.textRed, t)!,
      textOrange: Color.lerp(textOrange, other.textOrange, t)!,
      textGreen: Color.lerp(textGreen, other.textGreen, t)!,
      textBlue: Color.lerp(textBlue, other.textBlue, t)!,
      textPurple: Color.lerp(textPurple, other.textPurple, t)!,
    );
  }
}
