import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_workout_cab/firebase_options.dart';
import 'package:my_workout_cab/core/navigation/router.dart';
import 'package:my_workout_cab/core/theme/theme_extension.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  await Supabase.initialize(
    url: 'https://aponzacbhywcxmzmbwyo.supabase.co', 
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFwb256YWNiaHl3Y3htem1id3lvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDc4MzU1NjEsImV4cCI6MjA2MzQxMTU2MX0.TTbnfYn3LUTw-hCJ_bKeffGdkaHlXSQBWCQJh4_R030',
  );

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
            primaryColor: const Color(0xFF222222),
            backgroundColor: const Color(0xFFD9D9D9),
            cardColor: Colors.white,
            gnavColor: Colors.black,
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

