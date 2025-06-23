import 'package:flutter/material.dart';
import 'package:my_workout_cab/presentations/theme/theme_extension.dart';

class OnboardingProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final VoidCallback onBack;

  const OnboardingProgressIndicator({
    required this.currentStep,
    required this.totalSteps,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customTheme = theme.extension<CustomThemeExtension>();
    final primaryColor = customTheme?.primaryColor ?? Colors.blue;

    return SizedBox(
      height: 72,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (currentStep > 0)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: primaryColor),
                onPressed: onBack,
                tooltip: 'Назад',
              ),
            ),
          Center(
            child: SizedBox(
              width: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: LinearProgressIndicator(
                  value: (currentStep + 1) / totalSteps,
                  backgroundColor: primaryColor.withOpacity(0.5),
                  valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                  minHeight: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}