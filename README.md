# 🧭 Onboarding View

A simple and customizable onboarding screen package for Flutter apps. Quickly add beautiful intro screens to your mobile app with page indicators, titles, subtitles, images, and skip/done buttons.

---

## ✨ Features

- Smooth page transitions
- Built-in page indicator using `smooth_page_indicator`
- Supports asset images
- Skip and Done callbacks

---

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  onboarding_view: ^1.0.0
```

Then run
flutter pub get


## 🚀 Usage
  
Begin first by creating OnboardingPageViewModels

```.dart
OnboardingPageModel( 
title: 'Welcome!',
description: 'Start your journey with us.',
imagePath: 'assets/onboarding1.png',
),
```

And then use the OnboardingPageView as below

```.dart
OnboardingView(
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
```

