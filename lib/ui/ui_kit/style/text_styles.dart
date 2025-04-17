import 'package:flutter/material.dart';

class FontWeights {
  static const Bold = FontWeight.w700;
  static const SemiBold = FontWeight.w600;
  static const Medium = FontWeight.w500;
  static const Regular = FontWeight.w400;
}

class TextStyles {
  static const TextStyle Title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeights.SemiBold,
    height: 1.22, // 22 / 18
    letterSpacing: -0.09,
    fontFamily: "Pretendard",
  );

  static const TextStyle Headline1_Bold = TextStyle(
    fontSize: 22,
    fontWeight: FontWeights.Bold,
    height: 1.36, // 30 / 22
    letterSpacing: -0.11,
    fontFamily: "Pretendard",
  );

  static const TextStyle Headline2_SemiBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeights.SemiBold,
    height: 1.5, // 24 / 16
    letterSpacing: -0.08,
    fontFamily: "Pretendard",
  );

  static const TextStyle Headline2_Bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeights.Bold,
    height: 1.5, // 24 / 16
    letterSpacing: -0.08,
    fontFamily: "Pretendard",
  );

  static const TextStyle Body1_Regular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeights.Regular,
    height: 1.5, // 24 / 16
    letterSpacing: -0.08,
    fontFamily: "Pretendard",
  );

  static const TextStyle Body1_Medium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeights.Medium,
    height: 1.5, // 24 / 16
    letterSpacing: -0.08,
    fontFamily: "Pretendard",
  );

  static const TextStyle Body2_Regular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeights.Regular,
    height: 1.43, // 20 / 14
    letterSpacing: -0.07,
    fontFamily: "Pretendard",
  );

  static const TextStyle Body2_Medium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeights.Medium,
    height: 1.43, // 20 / 14
    letterSpacing: -0.07,
    fontFamily: "Pretendard",
  );

  static const TextStyle Body3_Regular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeights.Regular,
    height: 1.33, // 16 / 12
    letterSpacing: -0.06,
    fontFamily: "Pretendard",
  );

  static const TextStyle Body3_Medium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeights.Medium,
    height: 1.33, // 16 / 12
    letterSpacing: -0.06,
    fontFamily: "Pretendard",
  );

  static const TextStyle Label1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeights.Regular,
    height: 1.25, // 20 / 16
    letterSpacing: -0.08,
    fontFamily: "Pretendard",
  );

  static const TextStyle Label2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeights.Medium,
    height: 1.29, // 18 / 14
    letterSpacing: -0.07,
    fontFamily: "Pretendard",
  );

  static const TextStyle Label3 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeights.Medium,
    height: 1.33, // 16 / 12
    letterSpacing: -0.06,
    fontFamily: "Pretendard",
  );

  static const TextStyle Label4 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeights.Medium,
    height: 1.4, // 14 / 10
    letterSpacing: -0.05,
    fontFamily: "Pretendard",
  );

  static const TextStyle Caption1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeights.Regular,
    height: 1.29, // 18 / 14
    letterSpacing: -0.07,
    fontFamily: "Pretendard",
  );

  static const TextStyle Caption2 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeights.Regular,
    height: 1.33, // 16 / 12
    letterSpacing: -0.06,
    fontFamily: "Pretendard",
  );

  static const TextStyle Button1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeights.Medium,
    height: 1.25, // 20 / 16
    letterSpacing: -0.08,
    fontFamily: "Pretendard",
  );

  static const TextStyle Button2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeights.Medium,
    height: 1.29, // 18 / 14
    letterSpacing: -0.07,
    fontFamily: "Pretendard",
  );

  static const TextStyle Link1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeights.Medium,
    height: 1.5, // 24 / 16
    letterSpacing: -0.08,
    fontFamily: "Pretendard",
  );

  static const TextStyle Link2 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeights.Medium,
    height: 1.33, // 16 / 12
    letterSpacing: -0.06,
    fontFamily: "Pretendard",
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.solid,
  );

  static const TextStyle Link3 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeights.Medium,
    height: 1.29, // 18 / 14
    letterSpacing: -0.07,
    fontFamily: "Pretendard",
  );
}
