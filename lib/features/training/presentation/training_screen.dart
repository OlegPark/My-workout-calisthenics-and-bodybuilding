import 'package:flutter/material.dart';
import 'package:my_workout_cab/core/theme/theme_extension.dart';
import 'package:intl/intl.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeExtension>();
    final now = DateTime.now();
    
    return Scaffold(
      backgroundColor: customTheme?.backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final baseWidth = 375.0;
          final scale = constraints.maxWidth / baseWidth;
          
          final dates = List.generate(7, (index) => 
              DateTime(now.year, now.month, now.day - 3 + index));
          
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24 * scale, 
                vertical: 24 * scale
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40 * scale),
                  Text(
                    'Календарь тренировок',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24 * scale,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30 * scale),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: customTheme?.cardColor ?? Colors.grey,
                        width: 1 * scale,
                      ),
                      borderRadius: BorderRadius.circular(15 * scale),
                    ),
                    child: SizedBox(
                      width: 350 * scale,
                      height: 88 * scale,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(7, (index) {
                          final date = dates[index];
                          final isCurrentDay = date.day == now.day;
                          final isPastDay = date.isBefore(now) && !isCurrentDay;
                          final textColor = isPastDay ? customTheme?.backgroundColor : Colors.white;
                          
                          return GestureDetector(
                            onTap: () {
                              // Обработка нажатия на день
                            },
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: isCurrentDay 
                                    ? customTheme?.cardColor 
                                    : isPastDay
                                        ? customTheme?.primaryColor
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(10 * scale),
                              ),
                              child: SizedBox(
                                width: 42 * scale,
                                height: 74 * scale,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 8 * scale),
                                      child: Text(
                                        DateFormat('E').format(date),
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 12 * scale,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 12 * scale),
                                      child: Text(
                                        date.day.toString(),
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 16 * scale,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
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
}