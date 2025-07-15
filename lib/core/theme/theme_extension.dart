import 'package:flutter/material.dart';

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color? primaryColor;
  final Color? backgroundColor;
  final Color? cardColor;
  final Color? gnavColor;
  final TextStyle? customTextStyle;

  CustomThemeExtension({
    required this.primaryColor,
    required this.backgroundColor,
    required this.cardColor,
    required this.gnavColor,
    this.customTextStyle
  });

  @override
  CustomThemeExtension copyWith({
    Color? primaryColor,
    Color? backgroundColor,
    Color? cardColor,
    Color? gnavColor,
    TextStyle? customTextStyle,
  }) {
    return CustomThemeExtension(
      primaryColor: primaryColor ?? this.primaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      cardColor: cardColor ?? this.cardColor,
      gnavColor: gnavColor ?? this.gnavColor,
      customTextStyle: customTextStyle ?? this.customTextStyle,
    );
  }

  @override
  CustomThemeExtension lerp(ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;

    return CustomThemeExtension(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      cardColor: Color.lerp(cardColor, other.cardColor, t),
      gnavColor: Color.lerp(gnavColor, other.gnavColor, t),
      customTextStyle: TextStyle.lerp(customTextStyle, other.customTextStyle, t),
    );
  }
}