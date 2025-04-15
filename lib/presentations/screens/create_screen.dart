import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_workout_cab/presentations/theme/theme_extension.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeExtension>();
    
    return Scaffold(
      backgroundColor: customTheme?.backgroundColor ?? Colors.black,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Определяем базовые размеры для масштабирования
            final baseWidth = 375.0; // iPhone 8 width
            final scale = constraints.maxWidth / baseWidth;
            
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24 * scale),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40 * scale),
                    Text(
                      'Мои тренировки',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24 * scale,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40 * scale),
                    Center(
                      child: SvgPicture.asset(
                        'assets/images/ganteli.svg',
                        width: constraints.maxWidth * 0.7,
                        height: constraints.maxHeight * 0.3,
                      ),
                    ),
                    SizedBox(height: 40 * scale),
                    Center(
                      child: Text(
                        'Создайте свою\nпервую тренировку',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20 * scale,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 16 * scale),
                    Center(
                      child: Text(
                        'Настройте собственную\nпрограмму тренировок',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 13 * scale,
                        ),
                      ),
                    ),
                    SizedBox(height: 40 * scale),
                    Center(
                      child: SizedBox(
                        width: 251 * scale,
                        height: 46 * scale,
                        child: ElevatedButton(
                          onPressed: () {}, // Добавьте ваш обработчик
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8 * scale),
                            ),
                          ),
                          child: Text(
                            'НАЧАТЬ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16 * scale,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40 * scale),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}