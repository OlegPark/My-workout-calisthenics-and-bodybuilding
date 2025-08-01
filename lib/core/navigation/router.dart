import 'package:go_router/go_router.dart';
import 'package:my_workout_cab/core/navigation/gnav_bar.dart';
import 'package:my_workout_cab/features/create/presentation/widgets/exercises_screen.dart';


import 'package:my_workout_cab/features/onboarding/presentation/widgets/onboarding2.dart';



final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ExercisePage(),
    ),
    GoRoute(
      path: '/onboarding2',
      builder: (context, state) => const Onboarding2(),
    ),
  ],
);