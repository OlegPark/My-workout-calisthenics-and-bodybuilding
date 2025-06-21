import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:ui'; // Необходимо для BackdropFilter

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentStep = 0;
  final int _totalSteps = 5;
  late VideoPlayerController _videoController;
  bool _isVideoInitialized = false;
  String _videoError = '';
  
  // User data
  String? _gender;
  int _height = 170;
  int _weight = 70;
  int _desiredWeight = 65;
  Map<String, int> _goals = {
    'mainGoal': 0,
    'pullUps': 0,
    'pushUps': 0,
    'squats': 0,
  };

  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      _videoController = VideoPlayerController.asset('assets/video/SportVideo.mp4');
      await _videoController.initialize();
      setState(() {
        _isVideoInitialized = true;
      });
      _videoController.play();
      _videoController.setLooping(true);
      _videoController.setVolume(0); // Отключаем звук
    } catch (e) {
      setState(() {
        _videoError = 'Не удалось загрузить видео';
      });
      debugPrint('Video initialization error: $e');
    }
  }

  @override
  void dispose() {
    _videoController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < _totalSteps - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      setState(() => _currentStep++);
    } else {
      // Navigate to registration screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegistrationScreen()),
      );
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      setState(() => _currentStep--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background video or fallback
          if (_isVideoInitialized)
            Positioned.fill(
              child: AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              ),
            )
          else if (_videoError.isNotEmpty)
            Positioned.fill(
              child: Container(
                color: Colors.black,
                child: Center(
                  child: Text(
                    _videoError,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          else
            Positioned.fill(
              child: Container(color: Colors.black),
            ),
          
          // Blur effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          
          // Dark overlay for better text visibility
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          
          // Content
          Column(
            children: [
              SizedBox(height: 50),
              // Progress bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LinearProgressIndicator(
                  value: (_currentStep + 1) / _totalSteps,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  minHeight: 8,
                ),
              ),
              
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    _buildGenderSelection(),
                    _buildHeightSelection(),
                    _buildWeightSelection(),
                    _buildDesiredWeightSelection(),
                    _buildGoalsSelection(),
                  ],
                ),
              ),
              
              // Navigation buttons
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (_currentStep > 0)
                      ElevatedButton(
                        onPressed: _prevStep,
                        child: Text('Назад'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: _nextStep,
                      child: Text(_currentStep == _totalSteps - 1 ? 'Завершить' : 'Далее'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ... (остальные методы остаются без изменений)
  Widget _buildGenderSelection() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Выберите ваш пол',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
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

  Widget _buildGenderOption(String label, IconData icon, String gender) {
    final isSelected = _gender == gender;
    return GestureDetector(
      onTap: () => setState(() => _gender = gender),
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
            Icon(icon, size: 50, color: isSelected ? Colors.white : Colors.blue),
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

  Widget _buildHeightSelection() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Выберите ваш рост',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 40),
          Text(
            '$_height см',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: RotatedBox(
              quarterTurns: -1,
              child: Slider(
                value: _height.toDouble(),
                min: 120,
                max: 220,
                divisions: 100,
                label: '$_height см',
                onChanged: (value) => setState(() => _height = value.round()),
                activeColor: Colors.blue,
                inactiveColor: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeightSelection() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Выберите ваш вес',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 40),
          Text(
            '$_weight кг',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 20),
          Slider(
            value: _weight.toDouble(),
            min: 40,
            max: 150,
            divisions: 110,
            label: '$_weight кг',
            onChanged: (value) => setState(() => _weight = value.round()),
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildDesiredWeightSelection() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Выберите желаемый вес',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 40),
          Text(
            '$_desiredWeight кг',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 20),
          Slider(
            value: _desiredWeight.toDouble(),
            min: 40,
            max: 150,
            divisions: 110,
            label: '$_desiredWeight кг',
            onChanged: (value) => setState(() => _desiredWeight = value.round()),
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildGoalsSelection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Установите ваши цели',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 30),
          _buildGoalDropdown('Основная цель', 'mainGoal', ['Похудеть', 'Набрать мышцы', 'Поддерживать форму']),
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
        Text(label, style: TextStyle(fontSize: 16, color: Colors.white)),
        DropdownButtonFormField<int>(
          value: _goals[key],
          items: options.asMap().entries.map((entry) {
            return DropdownMenuItem<int>(
              value: entry.key,
              child: Text(entry.value, style: TextStyle(color: Colors.black)),
            );
          }).toList(),
          onChanged: (value) => setState(() => _goals[key] = value!),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          ),
        ),
      ],
    );
  }

  Widget _buildGoalCounter(String label, String key) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, color: Colors.white)),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove, color: Colors.white),
              onPressed: () => setState(() {
                if (_goals[key]! > 0) _goals[key] = _goals[key]! - 1;
              }),
            ),
            Text(
              '${_goals[key]}',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: () => setState(() => _goals[key] = _goals[key]! + 1),
            ),
          ],
        ),
      ],
    );
  }
}

class RegistrationScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Регистрация')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Имя пользователя'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите имя пользователя';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
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
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Пароль'),
                obscureText: true,
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
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
                child: Text('Зарегистрироваться'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}