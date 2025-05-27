import 'package:flutter/material.dart';
import 'package:onboarding/models/onboarding_page_model.dart';
import 'package:onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Demo',
      home: OnboardingView(
        pages: [
          OnboardingPageModel(
            title: "Welcome",
            description: "This is an awesome onboarding screen.",
            imageAsset: 'assets/images/intro1.png',
          ),
          OnboardingPageModel(
            title: "Learn Fast",
            description: "Get started with Flutter in minutes.",
            imageAsset: 'assets/images/intro2.png',
          ),
          OnboardingPageModel(
            title: "Let’s Go!",
            description: "You are ready to build something great.",
            imageAsset: 'assets/images/intro3.png',
          ),
        ],
        onDone: () {
          // Navigate to home or login
          debugPrint("Onboarding Done");
        },
        onSkip: () {
          debugPrint("Onboarding Skipped");
        },
      ),
    );
  }
}
