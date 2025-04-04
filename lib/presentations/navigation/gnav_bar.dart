import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_workout_cab/presentations/screens/create_screen.dart';
import 'package:my_workout_cab/presentations/screens/profile_screen.dart';
import 'package:my_workout_cab/presentations/screens/training_screen.dart';

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
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            pages[currentIndex],
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0), // Отступы вокруг GNav
                  child: GNav(
                    padding: EdgeInsets.all(15), // Убираем внутренние отступы GNav
                    tabBorderRadius: 30,
                    tabBackgroundColor: Colors.black,
                    curve: Curves.easeIn,
                    color: Colors.black,
                    activeColor: Colors.white,
                    gap: 8,
                    onTabChange: (index) => goToPage(index),
                    tabs: [
                      GButton(
                        icon: Icons.create_outlined,
                        text: 'Персонализ',
                      ),
                      GButton(
                        icon: Icons.fitness_center_outlined,
                        text: 'Тренировка',
                      ),
                      GButton(
                        icon: Icons.person_outline,
                        text: 'Профиль',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}