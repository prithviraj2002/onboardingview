library onboarding_view;

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'models/onboarding_page_model.dart';

class OnboardingView extends StatefulWidget {
  final List<OnboardingPageModel> pages;
  final VoidCallback onDone;
  final VoidCallback? onSkip;

  final Color backgroundColor;
  final Color titleColor;
  final Color descriptionColor;

  const OnboardingView({
    super.key,
    required this.pages,
    required this.onDone,
    this.onSkip,
    this.backgroundColor = Colors.white,
    this.titleColor = Colors.black,
    this.descriptionColor = Colors.grey,
  });

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _nextPage() {
    if (_currentIndex < widget.pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      widget.onDone();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.pages.length,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final page = widget.pages[index];
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(page.imageAsset, height: 250),
                        const SizedBox(height: 32),
                        Text(
                          page.title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: widget.titleColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          page.description,
                          style: TextStyle(
                            fontSize: 16,
                            color: widget.descriptionColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: Container()),
                InkWell(
                  onTap: () {
                    if (_currentIndex > 0) {
                      setState(() {
                        _currentIndex--;
                      });
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text("Back")
                ),
                Expanded(child: Container()),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: widget.pages.length,
                  effect: WormEffect(dotHeight: 10, dotWidth: 10),
                ),
                Expanded(child: Container()),
                InkWell(
                  onTap: _nextPage,
                  child: Text("Next")
                ),
                Expanded(child: Container()),
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _currentIndex = widget.pages.length - 1;
                  });
                  _pageController.animateToPage(
                    widget.pages.length - 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  _currentIndex == widget.pages.length - 1 ? "Done" : "Skip",
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
