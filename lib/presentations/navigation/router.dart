import 'package:go_router/go_router.dart';
import 'package:my_workout_cab/presentations/navigation/gnav_bar.dart';
import 'package:my_workout_cab/presentations/screens/onboardings/onboarding2.dart';



final GoRouter router = GoRouter(
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