import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/utils/app_extension.dart';

class OnboardingDotIndicator extends StatelessWidget {
  final int currentPosition;
  const OnboardingDotIndicator({Key? key, required this.currentPosition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 2.6),
          child: currentPosition == index
              ? Container(
                  width: 25,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: context.themeData.colorScheme.secondary,
                  ),
                )
              : Container(
                  width: 8.5,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.primaryColor.withOpacity(0.25),
                  ),
                ),
        ),
      ),
    );
  }
}
