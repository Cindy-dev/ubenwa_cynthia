import 'package:flutter/material.dart';

class ColorThemeExt extends ThemeExtension<ColorThemeExt> {
  final Color white;
  final Color black;
  final Color lightBlack;
  final Color blue;
  final Color yellow;
  final Color purple;
  final Color red;
  final Color green;

  ColorThemeExt({
    required this.blue,
    required this.black,
    required this.lightBlack,
    required this.yellow,
    required this.white,
    required this.purple,
    required this.red,
    required this.green,
  });
  @override
  ThemeExtension<ColorThemeExt> copyWith({
    Color? white,
    Color? blue,
    Color? black,
    Color? lightBlack,
    Color? yellow,
    Color? purple,
    Color? red,
    Color? green,
  }) {
    return ColorThemeExt(
      black: black ?? this.black,
      lightBlack: lightBlack ?? this.lightBlack,
      yellow: yellow ?? this.yellow,
      white: white ?? this.white,
      purple: purple ?? this.purple,
      red: red ?? this.red,
      blue: blue ?? this.blue,
      green: green ?? this.green,
    );
  }

  @override
  ThemeExtension<ColorThemeExt> lerp(
    covariant ThemeExtension<ColorThemeExt>? other,
    double t,
  ) {
    return this;
  }
}
