import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/utils/app_extension.dart';

class OnboardingDotIndicator extends StatelessWidget {
  final int currentPosition;
  const OnboardingDotIndicator({Key? key, required this.currentPosition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color indicatorColor() {
      if (currentPosition == 0 || currentPosition == 2) {
        return context.themeData.colorScheme.secondary;
      } else {
        return context.primaryColor;
      }
    }

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
                    color: indicatorColor(),
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
