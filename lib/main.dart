import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_workout_cab/presentations/navigation/gnav_bar.dart';
import 'package:my_workout_cab/presentations/screens/oneboarding2.dart';
import 'package:my_workout_cab/presentations/theme/theme_extension.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const GoogleNavBar(),
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
            primaryColor: const Color(0xFFD9D9D9),
            backgroundColor: const Color(0xFF222222),
            cardColor: const Color(0xFF3A3A3A),
            secondaryColor: const Color(0xFF2ECC71),
            gnavColor: const Color(0xFF222222),
            gnavColorRev: Colors.white,
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
            secondaryColor: const Color(0xFF2ECC71),
            gnavColor: const Color(0xFF222222),
            gnavColorRev: Colors.white,
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

