import 'package:flutter/material.dart';
import 'package:my_workout_cab/core/theme/theme_extension.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeExtension>();
    return Scaffold(
      backgroundColor: customTheme?.backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final baseWidth = 375.0;
          final scale = constraints.maxWidth / baseWidth;
          
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24 * scale, vertical: 24 * scale),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40 * scale),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Профиль',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24 * scale,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: (){}, 
                        icon: Icon(Icons.settings, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 30 * scale),
                  // Блок с аватаркой и данными пользователя
                  Row(
                    children: [
                      // Круглый контейнер (аватар)
                      Container(
                        width: 60 * scale,
                        height: 60 * scale,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 16 * scale),
                      // Текстовые данные
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Иван Иванов',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18 * scale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4 * scale),
                            Text(
                              'Продвинутый',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14 * scale,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Круглый контейнер справа
                      Container(
                        width: 24 * scale,
                        height: 24 * scale,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}