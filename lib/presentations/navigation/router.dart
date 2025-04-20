import 'package:go_router/go_router.dart';
import 'package:my_workout_cab/presentations/screens/oneboarding1.dart';
import 'package:my_workout_cab/presentations/screens/oneboarding2.dart';

final GoRouter router = GoRouter(
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