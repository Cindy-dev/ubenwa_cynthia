import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/presentation/utils/onboarding_strings.dart';
import 'package:ubenwa_cynthia/utils/app_extension.dart';
import 'package:ubenwa_cynthia/utils/app_routes.dart';
import 'package:ubenwa_cynthia/utils/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 500),
      () {
        Navigator.pushNamed(context, AppRoutes.onboardingScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              OnboardingStrings.appLogo,
            ),
            const SizedBox(width: 7),
            Text(
              "Mum Health",
              style: AppTextStyles.headingIrish.copyWith(
                shadows: [
                  Shadow(
                    color: context.colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
