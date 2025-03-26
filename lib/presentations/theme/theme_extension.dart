import 'package:flutter/material.dart';

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? cardColor;
  final Color? backgroundColor;
  final TextStyle? customTextStyle;

  CustomThemeExtension({
    required this.primaryColor,
    required this.secondaryColor,
    required this.cardColor,
    required this.backgroundColor,
    this.customTextStyle
  });

  @override
  CustomThemeExtension copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? cardColor,
    Color? backgroundColor,
    TextStyle? customTextStyle,
  }) {
    return CustomThemeExtension(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      cardColor: cardColor ?? this.cardColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      customTextStyle: customTextStyle ?? this.customTextStyle,
    );
  }

  @override
  CustomThemeExtension lerp(ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;

    return CustomThemeExtension(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
      cardColor: Color.lerp(cardColor, other.cardColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      customTextStyle: TextStyle.lerp(customTextStyle, other.customTextStyle, t),
    );
  }
}