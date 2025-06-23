import 'package:flutter/material.dart';

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
            'Выберите ваш рост',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 40),
          Text(
            '$height см',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: RotatedBox(
              quarterTurns: -1,
              child: Slider(
                value: height.toDouble(),
                min: 120,
                max: 220,
                divisions: 100,
                label: '$height см',
                onChanged: (value) => onHeightChanged(value.round()),
                activeColor: Colors.blue,
                inactiveColor: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}