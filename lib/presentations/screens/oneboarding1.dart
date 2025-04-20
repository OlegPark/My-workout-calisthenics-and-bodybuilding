import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_workout_cab/presentations/theme/theme_extension.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeExtension>();
    
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final scale = constraints.maxWidth / 375;
          
          return Stack(
            children: [
              Image.asset(
                'assets/images/Start.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Стань лучшей\nверсией себя!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24 * scale,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 33 * scale),
                    SizedBox(
                      width: 251 * scale,
                      height: 46 * scale,
                      child: ElevatedButton(
                        onPressed: () => context.go('/onboarding2'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: customTheme?.primaryColor ?? Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8 * scale),
                          ),
                        ),
                        child: Text(
                          'НАЧАТЬ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16 * scale,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 33 * scale),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'У вас нет аккаунта?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16 * scale,
                        ),
                      ),
                    ),
                    SizedBox(height: 40 * scale),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}