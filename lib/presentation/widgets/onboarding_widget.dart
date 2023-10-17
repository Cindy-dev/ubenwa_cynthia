import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/presentation/widgets/onboarding_dot_indicator.dart';
import 'package:ubenwa_cynthia/utils/app_extension.dart';
import 'package:ubenwa_cynthia/utils/theme/theme.dart';

class OnboardingWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final int currentPosition;
  const OnboardingWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.currentPosition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 55),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2,),
          OnboardingDotIndicator(currentPosition: currentPosition),
          SizedBox(height: context.deviceHeight() / 29),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.displayLarge,
          ),
          const SizedBox(height: 13),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.small.copyWith(fontSize: 14),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "Previous",
                  style: AppTextStyles.headingBold.copyWith(
                      color: context.themeData.colorScheme.tertiary
                          .withOpacity(0.5),
                      fontSize: 16),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Next",
                  style: AppTextStyles.headingBold
                      .copyWith(color: context.primaryColor, fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
