import 'package:flutter/material.dart';
import 'package:my_workout_cab/presentations/theme/theme_extension.dart';

class DeleteAccBottomSheet extends StatefulWidget {
  final double scale;

  const DeleteAccBottomSheet({
    super.key,
    required this.scale,
  });

  @override
  State<DeleteAccBottomSheet> createState() => _DeleteAccBottomSheetState();
}

class _DeleteAccBottomSheetState extends State<DeleteAccBottomSheet> {
  final List<bool> _selectedOptions = [false, false, false, false, false];
  final TextEditingController _otherReasonController = TextEditingController();

  @override
  void dispose() {
    _otherReasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeExtension>();
    
    final options = [
      'Не разобрался в приложении',
      'Перешел на другое приложение',
      'Неудовлетворительный прогресс',
      'Технические проблемы',
      'Другое',
    ];
    
    return Container(
      padding: EdgeInsets.all(24 * widget.scale),
      decoration: BoxDecoration(
        color: customTheme?.backgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25 * widget.scale)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40 * widget.scale,
              height: 4 * widget.scale,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(2 * widget.scale),
              ),
            ),
          ),
          SizedBox(height: 20 * widget.scale),
          Text(
            'Удалить аккаунт',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20 * widget.scale,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20 * widget.scale),
          
          // Цветные боксы с чекбоксами
          ...List.generate(options.length, (index) => Padding(
            padding: EdgeInsets.only(bottom: 10 * widget.scale),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedOptions[index] = !_selectedOptions[index];
                });
              },
              child: Container(
                height: 48 * widget.scale,
                width: 388 * widget.scale,
                decoration: BoxDecoration(
                  color: _selectedOptions[index] 
                    ? Colors.white.withOpacity(0.2)
                    : customTheme?.cardColor ?? Colors.grey,
                  borderRadius: BorderRadius.circular(25 * widget.scale),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 16 * widget.scale),
                        child: Text(
                          options[index],
                          style: TextStyle(
                            fontSize: 16 * widget.scale,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor: Colors.white,
                      ),
                      child: Checkbox(
                        value: _selectedOptions[index],
                        onChanged: (bool? value) {
                          setState(() {
                            _selectedOptions[index] = value ?? false;
                          });
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                        side: BorderSide(
                          color: Colors.white,
                          width: 1.5 * widget.scale,
                        ),
                        activeColor: Colors.transparent,
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return Colors.transparent;
                            }
                            return Colors.transparent;
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 8 * widget.scale),
                  ],
                ),
              ),
            ),
          )),
          
          SizedBox(height: 10 * widget.scale),
          // Большое текстовое поле
          SizedBox(
            width: 388 * widget.scale,
            height: 211 * widget.scale,
            child: TextField(
              controller: _otherReasonController,
              maxLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                filled: true,
                fillColor: customTheme?.cardColor ?? Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25 * widget.scale),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.only(
                  left: 16 * widget.scale,
                  right: 16 * widget.scale,
                  top: 14 * widget.scale,
                  bottom: 14 * widget.scale,
                ),
                hintText: 'Почему вы хотите удалить свой аккаунт?',
                hintStyle: TextStyle(
                  fontSize: 16 * widget.scale,
                  color: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
                alignLabelWithHint: true,
              ),
              style: TextStyle(
                fontSize: 16 * widget.scale,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              cursorColor: Colors.white,
            ),
          ),
          SizedBox(height: 24 * widget.scale),
          ClipRRect(
            borderRadius: BorderRadius.circular(25 * widget.scale),
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
                    borderRadius: BorderRadius.circular(25 * widget.scale),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48 * widget.scale,
                    child: Center(
                      child: Text(
                        'Сохранить изменения',
                        style: TextStyle(
                          fontSize: 16 * widget.scale,
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