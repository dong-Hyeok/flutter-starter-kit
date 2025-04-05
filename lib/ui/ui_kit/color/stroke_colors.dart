import 'package:flutter/material.dart';

class StrokeColors extends ThemeExtension<StrokeColors> {
  final Color strokeDefault;
  final Color strokeStrong;
  final Color strokeSoft;
  final Color strokeSoft_D;
  final Color strokePrimary;
  final Color strokeFocus;
  final Color strokeDisabled;
  final Color strokeError;
  final Color strokeInverse;

  StrokeColors({
    required this.strokeDefault,
    required this.strokeStrong,
    required this.strokeSoft,
    required this.strokeSoft_D,
    required this.strokePrimary,
    required this.strokeFocus,
    required this.strokeDisabled,
    required this.strokeError,
    required this.strokeInverse,
  });

  @override
  StrokeColors copyWith({
    Color? strokeDefault,
    Color? strokeStrong,
    Color? strokeSoft,
    Color? strokeSoft_D,
    Color? strokePrimary,
    Color? strokeFocus,
    Color? strokeDisabled,
    Color? strokeError,
    Color? strokeInverse,
  }) {
    return StrokeColors(
      strokeDefault: strokeDefault ?? this.strokeDefault,
      strokeStrong: strokeStrong ?? this.strokeStrong,
      strokeSoft: strokeSoft ?? this.strokeSoft,
      strokeSoft_D: strokeSoft_D ?? this.strokeSoft_D,
      strokePrimary: strokePrimary ?? this.strokePrimary,
      strokeFocus: strokeFocus ?? this.strokeFocus,
      strokeDisabled: strokeDisabled ?? this.strokeDisabled,
      strokeError: strokeError ?? this.strokeError,
      strokeInverse: strokeInverse ?? this.strokeInverse,
    );
  }

  @override
  StrokeColors lerp(ThemeExtension<StrokeColors>? other, double t) {
    if (other is! StrokeColors) return this;
    return StrokeColors(
      strokeDefault: Color.lerp(strokeDefault, other.strokeDefault, t)!,
      strokeStrong: Color.lerp(strokeStrong, other.strokeStrong, t)!,
      strokeSoft: Color.lerp(strokeSoft, other.strokeSoft, t)!,
      strokeSoft_D: Color.lerp(strokeSoft_D, other.strokeSoft_D, t)!,
      strokePrimary: Color.lerp(strokePrimary, other.strokePrimary, t)!,
      strokeFocus: Color.lerp(strokeFocus, other.strokeFocus, t)!,
      strokeDisabled: Color.lerp(strokeDisabled, other.strokeDisabled, t)!,
      strokeError: Color.lerp(strokeError, other.strokeError, t)!,
      strokeInverse: Color.lerp(strokeInverse, other.strokeInverse, t)!,
    );
  }
}
