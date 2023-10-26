import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/presentation/widgets/onboarding_button.dart';
import 'package:ubenwa_cynthia/presentation/widgets/onboarding_dot_indicator.dart';
import 'package:ubenwa_cynthia/utils/app_extension.dart';
import 'package:ubenwa_cynthia/utils/app_routes.dart';
import 'package:ubenwa_cynthia/utils/theme/theme.dart';

class OnboardingWidget extends StatelessWidget {
  final PageController pageController;
  final String title;
  final String subtitle;
  final int currentPosition;
  OnboardingWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.currentPosition,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceW = context.deviceWidth();
    final deviceH = context.deviceHeight();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24) +
          EdgeInsets.only(bottom: deviceH > 850 ? deviceH / 15 : 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: deviceH > 850 ? deviceH / 3 : deviceH / 2.5,
                bottom: deviceW / 12),
            child: OnboardingDotIndicator(currentPosition: currentPosition),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.textTheme.displayLarge,
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
          if (currentPosition != 3) const Spacer(),
          if (currentPosition == 3)
            Padding(
              padding: EdgeInsets.symmetric(vertical: deviceH > 850 ? 40 : 25),
              child: OnboardingButton(
                title: "Get Started",
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.milkSplashScreen);
                },
              ),
            ),
          currentPosition == 0
              ? Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 10),
                          curve: Curves.easeInOut);
                    },
                    child: Text(
                      "Show me How",
                      style: context.textTheme.headlineLarge
                          ?.copyWith(color: context.primaryColor, fontSize: 16),
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        pageController.previousPage(
                            duration: const Duration(milliseconds: 10),
                            curve: Curves.easeInOut);
                      },
                      child: Text(
                        "Previous",
                        style: context.textTheme.headlineLarge?.copyWith(
                          color: context.themeData.colorScheme.tertiary
                              .withOpacity(0.5),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    if (currentPosition != 3)
                      TextButton(
                        onPressed: () {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 10),
                              curve: Curves.easeInOut);
                        },
                        child: Text(
                          "Next",
                          style: context.textTheme.headlineLarge?.copyWith(
                            color: context.primaryColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                  ],
                ),
        ],
      ),
    );
  }
}
