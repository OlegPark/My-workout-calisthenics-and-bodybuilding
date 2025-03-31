import 'dart:ui';
import 'package:flutter/material.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final scale = constraints.maxWidth / 375;
          
          return Stack(
            children: [
              // Фоновое изображение
              Image.asset(
                'assets/images/Start.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              
              // Размытый оверлей
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                  child: Container(color: Colors.transparent),
                ),
              ),
              
              // Основной контент
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 25 * scale),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 251 * scale,
                        height: 46 * scale,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8 * scale),
                            ),
                          ),
                          child: Text(
                            'ВОЙТИ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16 * scale,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.only(top: 4 * scale, bottom: 0),
                              minimumSize: Size.zero,
                            ),
                            onPressed: () {},
                            child: Text(
                              'Забыли пароль?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16 * scale,
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.only(top: 0, bottom: 4 * scale),
                              minimumSize: Size.zero,
                            ),
                            onPressed: () {},
                            child: Text(
                              'У вас нет аккаунта?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16 * scale,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}