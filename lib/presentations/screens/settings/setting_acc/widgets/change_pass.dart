import 'package:flutter/material.dart';
import 'package:my_workout_cab/presentations/theme/theme_extension.dart';

class ChangePasswordBottomSheet extends StatelessWidget {
  final double scale;

  const ChangePasswordBottomSheet({
    super.key,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeExtension>();
    
    return Container(
      padding: EdgeInsets.all(24 * scale),
      decoration: BoxDecoration(
        color: customTheme?.backgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25 * scale)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40 * scale,
              height: 4 * scale,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(2 * scale),
              ),
            ),
          ),
          SizedBox(height: 20 * scale),
          Text(
            'Изменить пароль',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20 * scale,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20 * scale),
          Text(
            'Старый пароль',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16 * scale,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5 * scale),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: customTheme?.cardColor ?? Colors.grey,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25 * scale),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16 * scale,
                vertical: 10 * scale,
              ),
            ),
            style: TextStyle(
                fontSize: 16 * scale,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            cursorColor: Colors.white,
          ),
          SizedBox(height: 5 * scale),
          Text(
            'Новый пароль',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16 * scale,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5 * scale),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: customTheme?.cardColor ?? Colors.grey,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25 * scale),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16 * scale,
                vertical: 10 * scale,
              ),
            ),
            style: TextStyle(
                fontSize: 16 * scale,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            cursorColor: Colors.white,
          ),
          SizedBox(height: 5 * scale),
          Text(
            'Повторите новый пароль',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16 * scale,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5 * scale),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: customTheme?.cardColor ?? Colors.grey,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25 * scale),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16 * scale,
                vertical: 10 * scale,
              ),
            ),
            style: TextStyle(
                fontSize: 16 * scale,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            cursorColor: Colors.white,
          ),
          SizedBox(height: 24 * scale),
          ClipRRect(
            borderRadius: BorderRadius.circular(25 * scale),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Пароль успешно изменен'),
                    ),
                  );
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25 * scale),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48 * scale,
                    child: Center(
                      child: Text(
                        'Сохранить изменения',
                        style: TextStyle(
                          fontSize: 16 * scale,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }
}