import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_workout_cab/presentations/theme/theme_extension.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeExtension>();
    
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final scale = constraints.maxWidth / 375;
          
          return Stack(
            children: [
              Image.asset(
                'assets/images/forgot.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                  child: Container(color: Colors.transparent),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0 * scale),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0 * scale),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16 * scale,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 8 * scale),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: customTheme?.primaryColor ?? Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25 * scale),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16 * scale,
                            vertical: 14 * scale,
                          ),
                        ),
                        style: TextStyle(fontSize: 16 * scale),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 28 * scale),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 251 * scale,
                        height: 46 * scale,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: customTheme?.primaryColor ?? Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8 * scale),
                            ),
                          ),
                          child: Text(
                            'ВОЙТИ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16 * scale,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40 * scale)
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}