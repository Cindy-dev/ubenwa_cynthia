import 'package:flutter/material.dart';

class ColorThemeExt extends ThemeExtension<ColorThemeExt> {
  final Color white;
  final Color black;
  final Color blue;
  final Color yellow;

  ColorThemeExt({
    required this.blue,
    required this.black,
    required this.yellow,
    required this.white,
  });
  @override
  ThemeExtension<ColorThemeExt> copyWith({
    Color? white,
    Color? blue,
    Color? black,
    Color? yellow,
  }) {
    return ColorThemeExt(
        black: black ?? this.black,
        yellow: yellow ?? this.yellow,
        white: white ?? this.white,
        blue: blue ?? this.blue);
  }

  @override
  ThemeExtension<ColorThemeExt> lerp(
    covariant ThemeExtension<ColorThemeExt>? other,
    double t,
  ) {
    return this;
  }
}
