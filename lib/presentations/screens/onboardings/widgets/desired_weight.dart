import 'package:flutter/material.dart';

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
            'Выберите желаемый вес',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 40),
          Text(
            '$desiredWeight кг',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Slider(
            value: desiredWeight.toDouble(),
            min: 40,
            max: 150,
            divisions: 110,
            label: '$desiredWeight кг',
            onChanged: (value) => onDesiredWeightChanged(value.round()),
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}