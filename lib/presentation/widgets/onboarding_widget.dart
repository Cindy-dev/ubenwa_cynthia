import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/presentation/widgets/onboarding_animated_image.dart';
import 'package:ubenwa_cynthia/presentation/widgets/onboarding_dot_indicator.dart';
import 'package:ubenwa_cynthia/utils/app_extension.dart';
import 'package:ubenwa_cynthia/utils/theme/theme.dart';

class OnboardingWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final int currentPosition;
  bool pageChanged;
  VoidCallback? onNext;
  VoidCallback? onPrevious;
  OnboardingWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.currentPosition,
    this.onNext,
    this.pageChanged = false,
    this.onPrevious,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 55),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          OnboardingAnimatedImage(
            image: image,
            pageChanged: pageChanged,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: context.deviceHeight() / 29),
            child: OnboardingDotIndicator(currentPosition: currentPosition),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.displayLarge,
          ),
          const SizedBox(height: 13),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.small.copyWith(fontSize: 14),
            ),
          ),
          const Spacer(),
          currentPosition == 0
              ? Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: onNext,
                    child: Text(
                      "Show me How",
                      style: AppTextStyles.headingBold
                          .copyWith(color: context.primaryColor, fontSize: 16),
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: onPrevious,
                      child: Text(
                        "Previous",
                        style: AppTextStyles.headingBold.copyWith(
                            color: context.themeData.colorScheme.tertiary
                                .withOpacity(0.5),
                            fontSize: 16),
                      ),
                    ),
                    if (currentPosition != 3)
                      TextButton(
                        onPressed: onNext,
                        child: Text(
                          "Next",
                          style: AppTextStyles.headingBold.copyWith(
                              color: context.primaryColor, fontSize: 16),
                        ),
                      ),
                  ],
                ),
        ],
      ),
    );
  }
}
