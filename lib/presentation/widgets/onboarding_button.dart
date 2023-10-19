import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/utils/app_extension.dart';

class OnboardingButton extends StatelessWidget {
  VoidCallback? onPressed;
  final String title;
  OnboardingButton({Key? key, this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: context.textTheme.headlineLarge?.copyWith(
          color: context.themeData.cardColor,
          fontSize: 18,
        ),
      ),
    );
  }
}
