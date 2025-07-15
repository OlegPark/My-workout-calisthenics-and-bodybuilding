import 'package:go_router/go_router.dart';
import 'package:my_workout_cab/features/onboarding/presentation/widgets/onboarding1.dart';

import 'package:my_workout_cab/features/onboarding/presentation/widgets/onboarding2.dart';



final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Onboarding1(),
    ),
    GoRoute(
      path: '/onboarding2',
      builder: (context, state) => const Onboarding2(),
    ),
  ],
);