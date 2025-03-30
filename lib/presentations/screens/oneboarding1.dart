import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Start.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Стань лучшей\nверсией себя',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  SizedBox(
                    width: screenWidth * 0.7,
                    height: screenHeight * 0.06,
                    child: ElevatedButton(
                      onPressed: () => context.go('/onboarding2'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Начать',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'У вас нет аккаунта?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}