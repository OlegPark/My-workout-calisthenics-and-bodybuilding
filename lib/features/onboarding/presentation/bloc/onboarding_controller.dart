import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class OnboardingController extends ChangeNotifier {
  int currentStep = 0;
  final int totalSteps = 5;
  late VideoPlayerController videoController;
  bool isVideoInitialized = false;
  String videoError = '';
  
  String? gender = 'male';
  int height = 170;
  int weight = 70;
  int desiredWeight = 65;
  Map<String, int> goals = {
    'mainGoal': 0,
    'pullUps': 0,
    'pushUps': 0,
    'squats': 0,
  };

  final PageController pageController = PageController();

  Future<void> initializeVideo() async {
    try {
      videoController = VideoPlayerController.asset('assets/video/SportVideo.mp4');
      await videoController.initialize().then((_) {
        isVideoInitialized = true;
        notifyListeners();
        videoController.play();
        videoController.setLooping(true);
        videoController.setVolume(0);
      });
    } catch (e) {
      videoError = 'Не удалось загрузить видео';
      notifyListeners();
      debugPrint('Video initialization error: $e');
    }
  }

  void nextStep() {
    if (currentStep < totalSteps - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      currentStep++;
      notifyListeners();
    }
  }

  void prevStep() {
    if (currentStep > 0) {
      pageController.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      currentStep--;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    videoController.dispose();
    pageController.dispose();
    super.dispose();
  }
}