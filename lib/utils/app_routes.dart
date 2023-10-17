import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../presentation/screens/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  //static const String onboardingScreen = '/onboarding';

  static Map<String, Widget Function(BuildContext)> routes = {};

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return CupertinoPageRoute(
          builder: (context) => const SplashScreen(),
        );
      // Default Route is error route
      default:
        return CupertinoPageRoute(
          builder: (context) => errorView(settings.name),
        );
    }
  }

  static Widget errorView(String? name) {
    return Scaffold(body: Center(child: Text('404 $name View not found')));
  }
}
