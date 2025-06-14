import 'package:go_router/go_router.dart';

import 'package:my_workout_cab/presentations/screens/onboardings/onboarding2.dart';

import 'package:my_workout_cab/presentations/screens/onboardings/onboarding_screen.dart';



final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => OnboardingScreen(),
    ),
    GoRoute(
      path: '/onboarding2',
      builder: (context, state) => const Onboarding2(),
    ),
  ],
);