import 'package:flutter/material.dart';
import 'package:my_workout_cab/presentations/theme/theme_extension.dart';

class SettingsAccScreen extends StatelessWidget {
  const SettingsAccScreen({super.key});

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
              padding: EdgeInsets.symmetric(
                  horizontal: 24 * scale, vertical: 24 * scale),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40 * scale),
                  Text(
                    'Настройки',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24 * scale,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30 * scale),
                  Text(
                    'Никнейм',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16 * scale,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10 * scale),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: customTheme?.cardColor ?? Colors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25 * scale),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16 * scale,
                        vertical: 10 * scale,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16 * scale,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                    cursorColor: Colors.white,
                  ),
                  SizedBox(height: 14 * scale),
                  Text(
                    'Имя',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16 * scale,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10 * scale),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: customTheme?.cardColor ?? Colors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25 * scale),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16 * scale,
                        vertical: 10 * scale,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16 * scale,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                    cursorColor: Colors.white,
                  ),
                  SizedBox(height: 14 * scale),
                  Text(
                    'Пароль',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16 * scale,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10 * scale),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: customTheme?.cardColor ?? Colors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25 * scale),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16 * scale,
                        vertical: 10 * scale,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16 * scale,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                    cursorColor: Colors.white,
                  ),
                  SizedBox(height: 14 * scale),
                  Text(
                    'Страна',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16 * scale,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10 * scale),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: customTheme?.cardColor ?? Colors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25 * scale),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16 * scale,
                        vertical: 10 * scale,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16 * scale,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                    cursorColor: Colors.white,
                  ),
                  SizedBox(height: 14 * scale),
                  Text(
                    'Город',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16 * scale,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10 * scale),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: customTheme?.cardColor ?? Colors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25 * scale),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16 * scale,
                        vertical: 10 * scale,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16 * scale,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                    cursorColor: Colors.white,
                  ),
                  SizedBox(height: 14 * scale),
                  Text(
                    'О себе',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16 * scale,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10 * scale),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: customTheme?.cardColor ?? Colors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25 * scale),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16 * scale,
                        vertical: 10 * scale,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16 * scale,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                    cursorColor: Colors.white,
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
