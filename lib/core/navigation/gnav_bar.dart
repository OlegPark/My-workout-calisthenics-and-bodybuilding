import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_workout_cab/features/create/presentation/create_screen.dart';
import 'package:my_workout_cab/features/profile/presentation/profile_screen.dart';
import 'package:my_workout_cab/features/training/presentation/training_screen.dart';
import 'package:my_workout_cab/core/theme/theme_extension.dart';

class GoogleNavBar extends StatefulWidget {
  const GoogleNavBar({super.key});

  @override
  State<GoogleNavBar> createState() => _GoogleNavBarState();
}

class _GoogleNavBarState extends State<GoogleNavBar> {
  int currentIndex = 0;

  void goToPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> pages = [
    const CreateScreen(),
    const TrainingScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeExtension>();
    final mediaQuery = MediaQuery.of(context);
    final scale = mediaQuery.size.width / 375.0;

    return Scaffold(
      body: Stack(
        children: [
          pages[currentIndex],
          Positioned(
            left: 16 * scale,
            right: 16 * scale,
            bottom: 35 * scale,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30 * scale),
              ),
              child: Padding(
                padding: EdgeInsets.all(5 * scale),
                child: GNav(
                  padding: EdgeInsets.all(15 * scale),
                  tabBorderRadius: 30 * scale,
                  tabBackgroundColor: customTheme?.backgroundColor ?? Colors.grey,
                  curve: Curves.easeIn,
                  activeColor: Colors.white,
                  gap: 8 * scale,
                  onTabChange: goToPage,
                  tabs: [
                    GButton(
                      icon: Icons.create_outlined,
                      text: '      Персонализ      ',
                    ),
                    GButton(
                      icon: Icons.fitness_center_outlined,
                      text: '      Тренировка      ',
                    ),
                    GButton(
                      icon: Icons.person_outline,
                      text: '       Профиль        ',
                    ),
                  ],
                  tabBorder: Border.all(
                    color: Colors.grey,
                    width: 1 * scale,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}