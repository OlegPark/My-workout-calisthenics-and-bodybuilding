import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_workout_cab/presentations/screens/oneboarding1.dart';
import 'package:my_workout_cab/presentations/screens/oneboarding2.dart';
import 'package:my_workout_cab/presentations/theme/theme_extension.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Onboarding1(),
    ),
    GoRoute(
      path: '/onboarding2',
      builder: (context, state) => const Onboarding2(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
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
      // home: const Oneboarding1(),
    );
  }
}

