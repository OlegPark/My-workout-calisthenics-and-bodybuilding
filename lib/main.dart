import 'package:flutter/material.dart';
import 'package:my_workout_cab/presentations/screens/oneboarding1.dart';
import 'package:my_workout_cab/presentations/theme/theme_extension.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        extensions: [
          CustomThemeExtension(
            primaryColor: const Color(0xFF165932), 
            secondaryColor: const Color(0xFF2ECC71),
            cardColor: Colors.white,
            backgroundColor: const Color(0xFFECECEC),
            customTextStyle: const TextStyle(
              fontFamily: 'Roboto'
            ),
          ),
        ],
      ),
      // Светлая тема
      darkTheme: ThemeData.dark().copyWith(
        extensions: [
          CustomThemeExtension(
            primaryColor: const Color(0xFF2D490C),
            secondaryColor: const Color(0xFF66A71A),
            cardColor: Colors.white,
            backgroundColor: const Color(0xFFECECEC),
            customTextStyle: const TextStyle(
              fontFamily: 'Roboto'
            ),
          ),
        ],
      ),
      home: const Oneboarding1(),
    );
  }
}

