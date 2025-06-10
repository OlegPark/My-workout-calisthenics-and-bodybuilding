import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentStep = 0;
  final int _totalSteps = 5;
  
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
  void dispose() {
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
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/fitness_bg.jpg', // Replace with your image
              fit: BoxFit.cover,
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
                    // Step 1: Gender selection
                    _buildGenderSelection(),
                    
                    // Step 2: Height selection
                    _buildHeightSelection(),
                    
                    // Step 3: Weight selection
                    _buildWeightSelection(),
                    
                    // Step 4: Desired weight selection
                    _buildDesiredWeightSelection(),
                    
                    // Step 5: Goals selection
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
                        child: Text('Back'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: _nextStep,
                      child: Text(_currentStep == _totalSteps - 1 ? 'Finish' : 'Next'),
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

  Widget _buildGenderSelection() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Select Your Gender',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildGenderOption('Male', Icons.male, 'male'),
              SizedBox(width: 30),
              _buildGenderOption('Female', Icons.female, 'female'),
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
            'Select Your Height',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          Text(
            '$_height cm',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                label: '$_height cm',
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
            'Select Your Weight',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          Text(
            '$_weight kg',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Slider(
            value: _weight.toDouble(),
            min: 40,
            max: 150,
            divisions: 110,
            label: '$_weight kg',
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
            'Select Your Desired Weight',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          Text(
            '$_desiredWeight kg',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Slider(
            value: _desiredWeight.toDouble(),
            min: 40,
            max: 150,
            divisions: 110,
            label: '$_desiredWeight kg',
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
            'Set Your Goals',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          _buildGoalDropdown('Main Goal', 'mainGoal', ['Lose Weight', 'Gain Muscle', 'Stay Fit']),
          SizedBox(height: 20),
          _buildGoalCounter('Max Pull Ups', 'pullUps'),
          SizedBox(height: 20),
          _buildGoalCounter('Max Push Ups', 'pushUps'),
          SizedBox(height: 20),
          _buildGoalCounter('Max Squats', 'squats'),
        ],
      ),
    );
  }

  Widget _buildGoalDropdown(String label, String key, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16)),
        DropdownButtonFormField<int>(
          value: _goals[key],
          items: options.asMap().entries.map((entry) {
            return DropdownMenuItem<int>(
              value: entry.key,
              child: Text(entry.value),
            );
          }).toList(),
          onChanged: (value) => setState(() => _goals[key] = value!),
          decoration: InputDecoration(
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
        Text(label, style: TextStyle(fontSize: 16)),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => setState(() {
                if (_goals[key]! > 0) _goals[key] = _goals[key]! - 1;
              }),
            ),
            Text(
              '${_goals[key]}',
              style: TextStyle(fontSize: 20),
            ),
            IconButton(
              icon: Icon(Icons.add),
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
      appBar: AppBar(title: Text('Registration')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
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
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process registration
                    Navigator.pop(context);
                  }
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}