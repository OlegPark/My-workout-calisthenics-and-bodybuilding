import 'package:flutter/material.dart';

class GenderSelection extends StatelessWidget {
  final String? gender;
  final Function(String) onGenderSelected;

  const GenderSelection({
    required this.gender,
    required this.onGenderSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Выберите ваш пол',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildGenderOption('Мужской', Icons.male, 'male'),
              SizedBox(width: 30),
              _buildGenderOption('Женский', Icons.female, 'female'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGenderOption(String label, IconData icon, String genderValue) {
    final isSelected = gender == genderValue;
    return GestureDetector(
      onTap: () => onGenderSelected(genderValue),
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: isSelected ? Colors.white : Colors.blue,
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}