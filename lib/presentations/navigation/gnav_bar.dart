import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_workout_cab/presentations/screens/create_screen.dart';
import 'package:my_workout_cab/presentations/screens/profile_screen.dart';
import 'package:my_workout_cab/presentations/screens/training_screen.dart';
import 'package:my_workout_cab/presentations/theme/theme_extension.dart';

class GoogleNavBar extends StatefulWidget {
  const GoogleNavBar({super.key});

  @override
  State<GoogleNavBar> createState() => _GoogleNavBarState();
}

class _GoogleNavBarState extends State<GoogleNavBar> {
  int currentIndex = 0;

  void goToPage(index) {
    setState(() {
      currentIndex = index;
    });
  }

  List pages = [
    const CreateScreen(),
    const TrainingScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeExtension>();
    return Scaffold(
      body: Stack(
        children: [
          pages[currentIndex],
          Positioned(
            left: 16,
            right: 16,
            bottom: 35,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: GNav(
                  padding: EdgeInsets.all(15),
                  tabBorderRadius: 30,
                  tabBackgroundColor: customTheme?.backgroundColor ?? Colors.grey,
                  curve: Curves.easeIn,
                  activeColor: Colors.white,
                  
                  gap: 8,
                  onTabChange: (index) => goToPage(index),
                  tabs: [
                    GButton(
                      icon: Icons.create_outlined,
                      text: '        Персонализ        ',
                    ),
                    GButton(
                      icon: Icons.fitness_center_outlined,
                      text: '        Тренировка        ',
                    ),
                    GButton(
                      icon: Icons.person_outline,
                      text: '         Профиль          ',
                    ),
                  ],
                  tabBorder: Border.all(
                      color: Colors.grey,
                      width: 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
