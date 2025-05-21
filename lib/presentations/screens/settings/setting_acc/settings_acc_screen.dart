import 'package:flutter/material.dart';
import 'package:my_workout_cab/presentations/screens/settings/setting_acc/widgets/change_pass.dart';
import 'package:my_workout_cab/presentations/screens/settings/setting_acc/widgets/delete_acc.dart';
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
                  SizedBox(height: 5 * scale),
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
                        fontWeight: FontWeight.bold),
                    cursorColor: Colors.white,
                  ),
                  SizedBox(height: 5 * scale),
                  Text(
                    'Имя',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16 * scale,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5 * scale),
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
                        fontWeight: FontWeight.bold),
                    cursorColor: Colors.white,
                  ),
                  SizedBox(height: 5 * scale),
                  Text(
                    'Пароль',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16 * scale,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5 * scale),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25 * scale),
                    child: Material(
                      color: customTheme?.cardColor ?? Colors.grey,
                      child: InkWell(
                        onTap: () {
                          _showChangePasswordBottomSheet(context, scale);
                        },
                        child: SizedBox(
                          width: double.infinity,
                          height: 48 * scale,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16 * scale,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Изменить пароль',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16 * scale,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 16 * scale,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5 * scale),
                  Text(
                    'Страна',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16 * scale,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5 * scale),
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
                        fontWeight: FontWeight.bold),
                    cursorColor: Colors.white,
                  ),
                  SizedBox(height: 5 * scale),
                  Text(
                    'Город',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16 * scale,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5 * scale),
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
                        fontWeight: FontWeight.bold),
                    cursorColor: Colors.white,
                  ),
                  SizedBox(height: 5 * scale),
                  Text(
                    'О себе',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16 * scale,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5 * scale),
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
                        fontWeight: FontWeight.bold),
                    cursorColor: Colors.white,
                  ),
                  SizedBox(height: 60 * scale),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25 * scale),
                    child: Material(
                      color: const Color(0xFF432222),
                      child: InkWell(
                        onTap: () {
                          _showDeleteAccBottomSheet(context, scale);
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25 * scale),
                            border: Border.all(
                              color: Colors.red,
                              width: 1.0,
                            ),
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            height: 48 * scale,
                            child: Center(
                              child: Text(
                                'Удалить аккаунт',
                                style: TextStyle(
                                  fontSize: 16 * scale,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16 * scale),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25 * scale),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          // Действие сохранения изменений
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25 * scale),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            height: 48 * scale,
                            child: Center(
                              child: Text(
                                'Сохранить изменения',
                                style: TextStyle(
                                  fontSize: 16 * scale,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showChangePasswordBottomSheet(BuildContext context, double scale) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ChangePasswordBottomSheet(scale: scale),
    );
  }

  void _showDeleteAccBottomSheet(BuildContext context, double scale) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DeleteAccBottomSheet(scale: scale),
    );
  }
}