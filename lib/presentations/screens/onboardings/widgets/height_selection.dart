import 'package:flutter/material.dart';
import '../../../theme/theme_extension.dart';

class HeightSelection extends StatelessWidget {
  final int height;
  final ValueChanged<int> onHeightChanged;

  const HeightSelection({
    required this.height,
    required this.onHeightChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Рост',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 40),
          SizedBox(
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Статичный прямоугольник
                Builder(
                  builder: (context) {
                    final customTheme = Theme.of(context).extension<CustomThemeExtension>();
                    final primaryColor = customTheme?.primaryColor ?? Colors.blue;
                    return Align(
                      alignment: Alignment(0, 0.01), // чуть ниже центра
                      child: Container(
                        width: 250,
                        height: 46,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    );
                  },
                ),
                NotificationListener<ScrollNotification>(
                  onNotification: (_) => true,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 40,
                    diameterRatio: 1.2,
                    physics: FixedExtentScrollPhysics(),
                    perspective: 0.003,
                    onSelectedItemChanged: (index) => onHeightChanged(120 + index),
                    controller: FixedExtentScrollController(initialItem: height - 120),
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        final value = 120 + index;
                        final isSelected = value == height;
                        if (value > 220) return null;
                        final customTheme = Theme.of(context).extension<CustomThemeExtension>();
                        final backgroundColor = customTheme?.backgroundColor ?? Colors.white;
                        if (isSelected) {
                          return Center(
                            child: Text(
                              '$value',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: backgroundColor,
                              ),
                            ),
                          );
                        }
                        return Center(
                          child: Text(
                            '$value',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}