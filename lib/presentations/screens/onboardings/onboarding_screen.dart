import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'registration_screen.dart';
import 'widgets/desired_weight.dart';
import 'widgets/gender_selection.dart';
import 'widgets/goals_selection.dart';
import 'widgets/height_selection.dart';
import 'widgets/onboarding_controller.dart';
import 'widgets/progress_indicator.dart';
import 'widgets/weight_selection.dart';


class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final OnboardingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = OnboardingController();
    _controller.addListener(_handleControllerChange);
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    await _controller.initializeVideo();
  }

  void _handleControllerChange() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _controller.removeListener(_handleControllerChange);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background video
          Positioned.fill(
            child: _controller.isVideoInitialized && 
                  _controller.videoController.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.videoController.value.aspectRatio,
                    child: VideoPlayer(_controller.videoController),
                  )
                : Container(color: Colors.black),
          ),
          
          // Blur effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(color: Colors.transparent),
            ),
          ),
          
          // Dark overlay
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.5)),
          ),
          
          // Content
          SafeArea(
            child: Column(
              children: [
                OnboardingProgressIndicator(
                  currentStep: _controller.currentStep,
                  totalSteps: _controller.totalSteps,
                  onBack: _controller.prevStep,
                ),
                
                Expanded(
                  child: PageView(
                    controller: _controller.pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      GenderSelection(
                        gender: _controller.gender,
                        onGenderSelected: (gender) {
                          _controller.gender = gender;
                          _controller.notifyListeners();
                        },
                      ),
                      HeightSelection(
                        height: _controller.height,
                        onHeightChanged: (height) {
                          _controller.height = height;
                          _controller.notifyListeners();
                        },
                      ),
                      WeightSelection(
                        weight: _controller.weight,
                        onWeightChanged: (weight) {
                          _controller.weight = weight;
                          _controller.notifyListeners();
                        },
                      ),
                      DesiredWeightSelection(
                        desiredWeight: _controller.desiredWeight,
                        onDesiredWeightChanged: (weight) {
                          _controller.desiredWeight = weight;
                          _controller.notifyListeners();
                        },
                      ),
                      GoalsSelection(
                        goals: _controller.goals,
                        onGoalsChanged: (goals) {
                          _controller.goals = goals;
                          _controller.notifyListeners();
                        },
                      ),
                    ],
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_controller.currentStep < _controller.totalSteps - 1) {
                            _controller.nextStep();
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegistrationScreen(),
                              ),
                            );
                          }
                        },
                        child: Text(
                          _controller.currentStep == _controller.totalSteps - 1 
                              ? 'Завершить' 
                              : 'Далее',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}