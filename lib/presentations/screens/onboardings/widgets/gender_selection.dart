import 'package:flutter/material.dart';
import '../../../theme/theme_extension.dart';

class GenderSelection extends StatelessWidget {
  final String? gender;
  final Function(String) onGenderSelected;

  const GenderSelection({
    required this.gender,
    required this.onGenderSelected,
  });

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeExtension>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Ваш пол',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildGenderOption(context, 'Мужской', Icons.male, 'male', customTheme),
              SizedBox(width: 30),
              _buildGenderOption(context, 'Женский', Icons.female, 'female', customTheme),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGenderOption(BuildContext context, String label, IconData icon, String genderValue, CustomThemeExtension? customTheme) {
    final isSelected = gender == genderValue;
    final Color squareColor = customTheme?.primaryColor ?? Colors.blue;
    final Color iconTextColor = customTheme?.backgroundColor ?? Colors.white;
    final double size = isSelected ? 150 : 125;
    final double iconSize = isSelected ? 75 : 62;
    final double fontSize = isSelected ? 20 : 16;
    return GestureDetector(
      onTap: () => onGenderSelected(genderValue),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: squareColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
          border: isSelected ? Border.all(color: iconTextColor, width: 3) : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.ease,
              child: Icon(
                icon,
                size: iconSize,
                color: iconTextColor,
              ),
            ),
            SizedBox(height: 5),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 400),
              curve: Curves.ease,
              style: TextStyle(
                color: iconTextColor,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}