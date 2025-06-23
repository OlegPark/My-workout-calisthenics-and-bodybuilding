import 'package:flutter/material.dart';

class WeightSelection extends StatelessWidget {
  final int weight;
  final ValueChanged<int> onWeightChanged;

  const WeightSelection({
    required this.weight,
    required this.onWeightChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Выберите ваш вес',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 40),
          Text(
            '$weight кг',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Slider(
            value: weight.toDouble(),
            min: 40,
            max: 150,
            divisions: 110,
            label: '$weight кг',
            onChanged: (value) => onWeightChanged(value.round()),
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}