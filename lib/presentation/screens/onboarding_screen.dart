import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/presentation/widgets/onboarding_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnboardingWidget(
        title: "Welcome to a New\nMothering Experience",
        subtitle:
            "Now you can understand a lot about your new born, bukkle up for an experince you will always long for.",
      ),
    );
  }
}
