import 'package:flutter/material.dart';
import '../../../theme/theme_extension.dart';

class DesiredWeightSelection extends StatelessWidget {
  final int desiredWeight;
  final ValueChanged<int> onDesiredWeightChanged;

  const DesiredWeightSelection({
    required this.desiredWeight,
    required this.onDesiredWeightChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Желаемый вес',
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
                Builder(
                  builder: (context) {
                    final customTheme = Theme.of(context).extension<CustomThemeExtension>();
                    final primaryColor = customTheme?.primaryColor ?? Colors.blue;
                    return Align(
                      alignment: Alignment(0, 0.01),
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
                    onSelectedItemChanged: (index) => onDesiredWeightChanged(40 + index),
                    controller: FixedExtentScrollController(initialItem: desiredWeight - 40),
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        final value = 40 + index;
                        final isSelected = value == desiredWeight;
                        if (value > 150) return null;
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