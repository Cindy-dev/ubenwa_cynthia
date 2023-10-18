import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/presentation/widgets/onboarding_widget.dart';

import '../utils/onboarding_strings.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _currentPosition = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _updatePosition,
        children: [
          OnboardingWidget(
            image: OnboardingStrings.mum1,
            currentPosition: _currentPosition,
            title: "Welcome to a New\nMothering Experience",
            subtitle: "Now you can understand a lot about your new born,"
                " buckle up for an experience you will always long for.",
            onNext: () => _pageController.nextPage(
                duration: const Duration(milliseconds: 10),
                curve: Curves.easeInOut),
          ),
          OnboardingWidget(
            image: OnboardingStrings.mum2,
            currentPosition: _currentPosition,
            title: "A Cry with Meaning",
            subtitle: "Now with great feedbacks, you can understand a "
                "lot about your new born cry patter "
                "and prepare for common cry peak period",
            onNext: () => _pageController.nextPage(
                duration: const Duration(milliseconds: 10),
                curve: Curves.easeInOut),
            onPrevious: () => _pageController.previousPage(
                duration: const Duration(milliseconds: 10),
                curve: Curves.easeInOut),
          ),
          OnboardingWidget(
            image: OnboardingStrings.mum3,
            currentPosition: _currentPosition,
            title: "Analytical Insight",
            subtitle:
                "Be your baby’s doctor by viewing great insight and analysis;"
                "you get to see how your baby cry activity varies in terms of "
                "duration and frequency to help you make good decisions",
            onNext: () => _pageController.nextPage(
                duration: const Duration(milliseconds: 10),
                curve: Curves.easeInOut),
            onPrevious: () => _pageController.previousPage(
                duration: const Duration(milliseconds: 10),
                curve: Curves.easeInOut),
          ),
          OnboardingWidget(
            image: OnboardingStrings.mum4,
            currentPosition: _currentPosition,
            title: "Happy Mom\nHappy Home",
            subtitle: "Reduce you baby crying time whilst getting "
                "your schedule back together by planning for time "
                "of cry activity and time of quite.",
            onPrevious: () => _pageController.previousPage(
                duration: const Duration(milliseconds: 10),
                curve: Curves.easeInOut),
          ),
        ],
      ),
    );
  }

  void _updatePosition(int position) {
    setState(() => _currentPosition = position);
  }
}
