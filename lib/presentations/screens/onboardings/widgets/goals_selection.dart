import 'package:flutter/material.dart';

class GoalsSelection extends StatelessWidget {
  final Map<String, int> goals;
  final ValueChanged<Map<String, int>> onGoalsChanged;

  const GoalsSelection({
    required this.goals,
    required this.onGoalsChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Установите ваши цели',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 30),
          _buildGoalDropdown(
            'Основная цель',
            'mainGoal',
            ['Похудеть', 'Набрать мышцы', 'Поддерживать форму'],
          ),
          SizedBox(height: 20),
          _buildGoalCounter('Макс. подтягиваний', 'pullUps'),
          SizedBox(height: 20),
          _buildGoalCounter('Макс. отжиманий', 'pushUps'),
          SizedBox(height: 20),
          _buildGoalCounter('Макс. приседаний', 'squats'),
        ],
      ),
    );
  }

  Widget _buildGoalDropdown(String label, String key, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        DropdownButtonFormField<int>(
          value: goals[key],
          items: options.asMap().entries.map((entry) {
            return DropdownMenuItem<int>(
              value: entry.key,
              child: Text(
                entry.value,
                style: TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              final newGoals = Map<String, int>.from(goals);
              newGoals[key] = value;
              onGoalsChanged(newGoals);
            }
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGoalCounter(String label, String key) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove, color: Colors.white),
              onPressed: () {
                if (goals[key]! > 0) {
                  final newGoals = Map<String, int>.from(goals);
                  newGoals[key] = goals[key]! - 1;
                  onGoalsChanged(newGoals);
                }
              },
            ),
            Text(
              '${goals[key]}',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: () {
                final newGoals = Map<String, int>.from(goals);
                newGoals[key] = goals[key]! + 1;
                onGoalsChanged(newGoals);
              },
            ),
          ],
        ),
      ],
    );
  }
}