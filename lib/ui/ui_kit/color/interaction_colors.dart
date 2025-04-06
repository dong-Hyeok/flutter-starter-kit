import 'package:flutter/material.dart';

class InteractionColors extends ThemeExtension<InteractionColors> {
  final Color interactionDimmed;
  final Color interactionDimmed_D;
  final Color interactionTransparentDark;
  final Color interactionPressed;
  final Color interactionPressedInverse;
  final Color interactionLinkPressedInverse;

  InteractionColors({
    required this.interactionDimmed,
    required this.interactionDimmed_D,
    required this.interactionTransparentDark,
    required this.interactionPressed,
    required this.interactionPressedInverse,
    required this.interactionLinkPressedInverse,
  });

  @override
  InteractionColors copyWith({
    Color? interactionDimmed,
    Color? interactionDimmed_D,
    Color? interactionTransparentDark,
    Color? interactionPressed,
    Color? interactionPressedInverse,
    Color? interactionLinkPressedInverse,
  }) {
    return InteractionColors(
      interactionDimmed: interactionDimmed ?? this.interactionDimmed,
      interactionDimmed_D: interactionDimmed_D ?? this.interactionDimmed_D,
      interactionTransparentDark: interactionTransparentDark ?? this.interactionTransparentDark,
      interactionPressed: interactionPressed ?? this.interactionPressed,
      interactionPressedInverse: interactionPressedInverse ?? this.interactionPressedInverse,
      interactionLinkPressedInverse:
          interactionLinkPressedInverse ?? this.interactionLinkPressedInverse,
    );
  }

  @override
  InteractionColors lerp(ThemeExtension<InteractionColors>? other, double t) {
    if (other is! InteractionColors) return this;
    return InteractionColors(
      interactionDimmed: Color.lerp(interactionDimmed, other.interactionDimmed, t)!,
      interactionDimmed_D: Color.lerp(interactionDimmed_D, other.interactionDimmed_D, t)!,
      interactionTransparentDark:
          Color.lerp(interactionTransparentDark, other.interactionTransparentDark, t)!,
      interactionPressed: Color.lerp(interactionPressed, other.interactionPressed, t)!,
      interactionPressedInverse:
          Color.lerp(interactionPressedInverse, other.interactionPressedInverse, t)!,
      interactionLinkPressedInverse:
          Color.lerp(interactionLinkPressedInverse, other.interactionLinkPressedInverse, t)!,
    );
  }
}
