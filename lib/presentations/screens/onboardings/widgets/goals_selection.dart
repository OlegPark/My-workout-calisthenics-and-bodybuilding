import 'package:flutter/material.dart';
import 'package:my_workout_cab/presentations/theme/theme_extension.dart';

class GoalsSelection extends StatelessWidget {
  final Map<String, int> goals;
  final ValueChanged<Map<String, int>> onGoalsChanged;

  const GoalsSelection({
    required this.goals,
    required this.onGoalsChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomThemeExtension>();
    final primaryColor = theme?.primaryColor ?? const Color(0xFFD9D9D9);
    
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildGoalSelector(
            context,
            'Цель',
            'mainGoal',
            ['Похудеть', 'Набор мышечной массы', 'Поддерживать форму'],
            primaryColor,
          ),
          SizedBox(height: 20),
          _buildGoalSelector(
            context,
            'Максимально подтягиваний',
            'pullUps',
            ['<6', '6-10', '11-15', '>15'],
            primaryColor,
          ),
          SizedBox(height: 20),
          _buildGoalSelector(
            context,
            'Максимально отжиманий',
            'pushUps',
            ['<11', '11-20', '21-30', '>30'],
            primaryColor,
          ),
          SizedBox(height: 20),
          _buildGoalSelector(
            context,
            'Максимально приседаний',
            'squats',
            ['<21', '21-30', '31-40', '>40'],
            primaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildGoalSelector(
    BuildContext context,
    String label,
    String key,
    List<String> options,
    Color primaryColor,
  ) {
    final selectedIndex = goals[key] ?? 0;
    final selectedText = selectedIndex < options.length ? options[selectedIndex] : options[0];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16, 
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () => _showGoalBottomSheet(context, key, options, primaryColor),
          child: Container(
            height: 46,
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedText,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showGoalBottomSheet(
    BuildContext context,
    String key,
    List<String> options,
    Color primaryColor,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      'Выберите диапазон',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    ...options.asMap().entries.map((entry) {
                      final index = entry.key;
                      final option = entry.value;
                      final isSelected = goals[key] == index;
                      
                      return GestureDetector(
                        onTap: () {
                          final newGoals = Map<String, int>.from(goals);
                          newGoals[key] = index;
                          onGoalsChanged(newGoals);
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: isSelected ? primaryColor : Colors.grey[100],
                            borderRadius: BorderRadius.circular(15),
                            border: isSelected 
                              ? Border.all(color: primaryColor, width: 2)
                              : null,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                option,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: isSelected ? Colors.black : Colors.grey[700],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (isSelected)
                                Icon(
                                  Icons.check,
                                  color: Colors.black,
                                  size: 20,
                                ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}