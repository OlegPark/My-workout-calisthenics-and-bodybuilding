import 'package:flutter/material.dart';
import 'package:my_workout_cab/features/settings/presentation/widgets/change_pass.dart';
import 'package:my_workout_cab/core/theme/theme_extension.dart';

class SettingsFitScreen extends StatelessWidget {
  const SettingsFitScreen({super.key});

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
                    'Пол',
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
                                  '',
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
                    'Рост',
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
                                  '',
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
                    'Вес',
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
                                  '',
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
                    'Уровень',
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
                                  '',
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
                    'Цель',
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
                                  '',
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
                    'Максимально подтягиваний',
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
                                  '',
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
                    'Максимально отжиманий',
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
                                  '',
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
                    'Максимально приседаний',
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
                                  '',
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
}