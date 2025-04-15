import 'package:flutter/material.dart';
import 'package:my_workout_cab/presentations/navigation/router.dart';
import 'package:my_workout_cab/presentations/theme/theme_extension.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData.light().copyWith(
        extensions: [
          CustomThemeExtension(
            primaryColor: const Color(0xFFD9D9D9),
            backgroundColor: const Color(0xFF222222),
            cardColor: const Color(0xFF3A3A3A),
            gnavColor: const Color(0xFFFFFFFF),
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
            primaryColor: const Color(0xFF165932),
            backgroundColor: const Color(0xFF3A3A3A),
            cardColor: Colors.white,
            gnavColor: const Color(0xFF222222),
            customTextStyle: const TextStyle(
              fontFamily: 'Roboto'
            ),
          ),
        ],
      ),
      // home: const Oneboarding1(),
    );
  }
}

