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
      style: TextButton.styleFrom(
        minimumSize: const Size(double.maxFinite, 20),
        backgroundColor: context.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
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
