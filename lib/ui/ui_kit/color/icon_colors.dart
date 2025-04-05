import 'package:flutter/material.dart';

class IconColors extends ThemeExtension<IconColors> {
  final Color iconStrong;
  final Color iconDefault;
  final Color iconSoft;
  final Color iconActive;
  final Color iconDisabled;
  final Color iconDisabledSoft;
  final Color iconInverse;
  final Color iconInverse_D;
  final Color iconPrimary;
  final Color iconError;
  final Color iconRed;
  final Color iconOrange;
  final Color iconGreen;
  final Color iconBlue;
  final Color iconPurple;

  IconColors({
    required this.iconStrong,
    required this.iconDefault,
    required this.iconSoft,
    required this.iconActive,
    required this.iconDisabled,
    required this.iconDisabledSoft,
    required this.iconInverse,
    required this.iconInverse_D,
    required this.iconPrimary,
    required this.iconError,
    required this.iconRed,
    required this.iconOrange,
    required this.iconGreen,
    required this.iconBlue,
    required this.iconPurple,
  });

  @override
  IconColors copyWith({
    Color? iconStrong,
    Color? iconDefault,
    Color? iconSoft,
    Color? iconActive,
    Color? iconDisabled,
    Color? iconDisabledSoft,
    Color? iconInverse,
    Color? iconInverse_D,
    Color? iconPrimary,
    Color? iconError,
    Color? iconRed,
    Color? iconOrange,
    Color? iconGreen,
    Color? iconBlue,
    Color? iconPurple,
  }) {
    return IconColors(
      iconStrong: iconStrong ?? this.iconStrong,
      iconDefault: iconDefault ?? this.iconDefault,
      iconSoft: iconSoft ?? this.iconSoft,
      iconActive: iconActive ?? this.iconActive,
      iconDisabled: iconDisabled ?? this.iconDisabled,
      iconDisabledSoft: iconDisabledSoft ?? this.iconDisabledSoft,
      iconInverse: iconInverse ?? this.iconInverse,
      iconInverse_D: iconInverse_D ?? this.iconInverse_D,
      iconPrimary: iconPrimary ?? this.iconPrimary,
      iconError: iconError ?? this.iconError,
      iconRed: iconRed ?? this.iconRed,
      iconOrange: iconOrange ?? this.iconOrange,
      iconGreen: iconGreen ?? this.iconGreen,
      iconBlue: iconBlue ?? this.iconBlue,
      iconPurple: iconPurple ?? this.iconPurple,
    );
  }

  @override
  IconColors lerp(ThemeExtension<IconColors>? other, double t) {
    if (other is! IconColors) return this;
    return IconColors(
      iconStrong: Color.lerp(iconStrong, other.iconStrong, t)!,
      iconDefault: Color.lerp(iconDefault, other.iconDefault, t)!,
      iconSoft: Color.lerp(iconSoft, other.iconSoft, t)!,
      iconActive: Color.lerp(iconActive, other.iconActive, t)!,
      iconDisabled: Color.lerp(iconDisabled, other.iconDisabled, t)!,
      iconDisabledSoft: Color.lerp(iconDisabledSoft, other.iconDisabledSoft, t)!,
      iconInverse: Color.lerp(iconInverse, other.iconInverse, t)!,
      iconInverse_D: Color.lerp(iconInverse_D, other.iconInverse_D, t)!,
      iconPrimary: Color.lerp(iconPrimary, other.iconPrimary, t)!,
      iconError: Color.lerp(iconError, other.iconError, t)!,
      iconRed: Color.lerp(iconRed, other.iconRed, t)!,
      iconOrange: Color.lerp(iconOrange, other.iconOrange, t)!,
      iconGreen: Color.lerp(iconGreen, other.iconGreen, t)!,
      iconBlue: Color.lerp(iconBlue, other.iconBlue, t)!,
      iconPurple: Color.lerp(iconPurple, other.iconPurple, t)!,
    );
  }
}
