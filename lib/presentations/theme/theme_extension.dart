import 'package:flutter/material.dart';

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color? primaryColor;
  final Color? backgroundColor;
  final Color? cardColor;
  final Color? secondaryColor;
  final Color? gnavColor;
  final Color? gnavColorRev;
  final TextStyle? customTextStyle;

  CustomThemeExtension({
    required this.primaryColor,
    required this.backgroundColor,
    required this.cardColor,
    required this.secondaryColor,
    required this.gnavColor,
    required this.gnavColorRev,
    this.customTextStyle
  });

  @override
  CustomThemeExtension copyWith({
    Color? primaryColor,
    Color? backgroundColor,
    Color? cardColor,
    Color? secondaryColor,
    Color? gnavColor,
    Color? gnavColorRev,
    TextStyle? customTextStyle,
  }) {
    return CustomThemeExtension(
      primaryColor: primaryColor ?? this.primaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      cardColor: cardColor ?? this.cardColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      gnavColor: gnavColor ?? this.gnavColor,
      gnavColorRev: gnavColorRev ?? this.gnavColorRev,
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
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
      gnavColor: Color.lerp(gnavColor, other.gnavColor, t),
      gnavColorRev: Color.lerp(gnavColorRev, other.gnavColorRev, t),
      customTextStyle: TextStyle.lerp(customTextStyle, other.customTextStyle, t),
    );
  }
}