import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_workout_cab/presentations/theme/theme_extension.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _fullnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeExtension>();
    
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final scale = constraints.maxWidth / 375;
          
          return Stack(
            children: [
              // Фоновое изображение
              Image.asset(
                'assets/images/registration.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              // Размытие фона
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                  child: Container(color: Colors.transparent),
                ),
              ),
              // Затемнение
              Container(
                color: Colors.black.withOpacity(0.3),
              ),

              SafeArea(
                child: Stack(
                  children: [
                    // Кнопка назад вверху
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15 * scale),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 24 * scale,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                    // Центрированная форма
                    Padding(
                      padding: EdgeInsets.only(left: 20 * scale, right: 20 * scale),
                      child: Form(
                        key: _formKey,
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0 * scale),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Логин',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16 * scale,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8 * scale),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 15 * scale),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(25 * scale),
                                        child: ColoredBox(
                                          color: customTheme?.primaryColor ?? Colors.white,
                                          child: SizedBox(
                                            height: 38 * scale,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 20 * scale),
                                              child: TextFormField(
                                                controller: _usernameController,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  contentPadding: EdgeInsets.zero,
                                                ),
                                                style: TextStyle(
                                                  fontSize: 16 * scale,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                                                    return 'Пожалуйста, введите логин пользователя';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10 * scale),

                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0 * scale),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Полное имя',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16 * scale,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8 * scale),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 15 * scale),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(25 * scale),
                                        child: ColoredBox(
                                          color: customTheme?.primaryColor ?? Colors.white,
                                          child: SizedBox(
                                            height: 38 * scale,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 20 * scale),
                                              child: TextFormField(
                                                controller: _fullnameController,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  contentPadding: EdgeInsets.zero,
                                                ),
                                                style: TextStyle(
                                                  fontSize: 16 * scale,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                                                    return 'Пожалуйста, введите имя пользователя';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10 * scale),
                                    // Email
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0 * scale),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Email',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16 * scale,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8 * scale),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 15 * scale),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(25 * scale),
                                        child: ColoredBox(
                                          color: customTheme?.primaryColor ?? Colors.white,
                                          child: SizedBox(
                                            height: 38 * scale,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 20 * scale),
                                              child: TextFormField(
                                                controller: _emailController,
                                                keyboardType: TextInputType.emailAddress,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  contentPadding: EdgeInsets.zero,
                                                ),
                                                style: TextStyle(
                                                  fontSize: 16 * scale,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                                                    return 'Пожалуйста, введите email';
                                                  }
                                                  if (!value.contains('@')) {
                                                    return 'Пожалуйста, введите корректный email';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10 * scale),
                                    // Пароль
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0 * scale),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Пароль',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16 * scale,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8 * scale),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 15 * scale),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(25 * scale),
                                        child: ColoredBox(
                                          color: customTheme?.primaryColor ?? Colors.white,
                                          child: SizedBox(
                                            height: 38 * scale,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 20 * scale),
                                              child: TextFormField(
                                                controller: _passwordController,
                                                obscureText: true,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  contentPadding: EdgeInsets.zero,
                                                ),
                                                style: TextStyle(
                                                  fontSize: 16 * scale,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                                                    return 'Пожалуйста, введите пароль';
                                                  }
                                                  if (value.length < 6) {
                                                    return 'Пароль должен быть не менее 6 символов';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 40 * scale),
                                    Center(
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/buttonG.png',
                                          height: 46 * scale,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Кнопка регистрации внизу
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 251,
                              height: 46,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pop(context);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: customTheme?.primaryColor ?? Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 2,
                                ),
                                child: Text(
                                  'ЗАРЕГИСТРИРОВАТЬСЯ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}