import 'package:flutter/material.dart';
import 'package:my_workout_cab/presentations/theme/theme_extension.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeExtension>();
    return Scaffold(
      backgroundColor: customTheme?.backgroundColor,
      body: Center(
        child: Column(
          children: [
            Text(
              'Профиль',
              style: TextStyle(color: Colors.white),
            ),
            // HumanBodyHeatmap(),
          ],
        ),
      ),
    );
  }
}
