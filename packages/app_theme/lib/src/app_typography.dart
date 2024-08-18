import 'package:flutter/material.dart';

abstract class TextSizes {
  TextStyle get title;
  TextStyle get subtitle;
}

extension FontWeightExt on TextStyle {
  TextStyle get w100 {
    return copyWith(fontWeight: FontWeight.w100);
  }

  TextStyle get w300 {
    return copyWith(fontWeight: FontWeight.w300);
  }

  TextStyle get w400 {
    return copyWith(fontWeight: FontWeight.w400);
  }

  TextStyle get w500 {
    return copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle get w600 {
    return copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle get w700 {
    return copyWith(fontWeight: FontWeight.w700);
  }

  TextStyle get w900 {
    return copyWith(fontWeight: FontWeight.w900);
  }
}

class AppTypographyData {
  const AppTypographyData({
    required this.sp10,
    required this.sp12,
    required this.sp14,
    required this.sp15,
    required this.sp16,
    required this.sp17,
    required this.sp18,
    required this.sp20,
    required this.sp24,
    required this.sp32,
    required this.sp34,
    required this.sp40,
    required this.sp64,
  });

  factory AppTypographyData.regular() {
    return const AppTypographyData(
      sp10: TextStyle(fontSize: 10),
      sp12: TextStyle(fontSize: 12),
      sp14: TextStyle(fontSize: 14),
      sp15: TextStyle(fontSize: 15),
      sp16: TextStyle(fontSize: 16),
      sp17: TextStyle(fontSize: 17),
      sp18: TextStyle(fontSize: 18),
      sp20: TextStyle(fontSize: 20),
      sp24: TextStyle(fontSize: 24),
      sp32: TextStyle(fontSize: 32),
      sp34: TextStyle(fontSize: 34),
      sp40: TextStyle(fontSize: 40),
      sp64: TextStyle(fontSize: 64),
    );
  }

  final TextStyle sp10;
  final TextStyle sp12;
  final TextStyle sp14;
  final TextStyle sp15;
  final TextStyle sp16;
  final TextStyle sp17;
  final TextStyle sp18;
  final TextStyle sp20;
  final TextStyle sp24;
  final TextStyle sp32;
  final TextStyle sp34;
  final TextStyle sp40;
  final TextStyle sp64;
}
