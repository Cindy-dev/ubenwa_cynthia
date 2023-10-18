import 'onboarding_strings.dart';

String getImage(int index) {
  switch (index) {
    case 0:
      return OnboardingStrings.mum1;
    case 1:
      return OnboardingStrings.mum2;
    case 2:
      return OnboardingStrings.mum3;
    case 3:
      return OnboardingStrings.mum4;
    default:
      return OnboardingStrings.mum1;
  }
}