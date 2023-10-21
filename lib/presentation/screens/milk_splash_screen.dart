import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/presentation/screens/home_screen.dart';
import 'package:ubenwa_cynthia/presentation/utils/milk_splash_strings.dart';
import 'package:ubenwa_cynthia/utils/app_extension.dart';

class MilkSplashScreen extends StatefulWidget {
  const MilkSplashScreen({Key? key}) : super(key: key);

  @override
  State<MilkSplashScreen> createState() => _MilkSplashScreenState();
}

class _MilkSplashScreenState extends State<MilkSplashScreen>
    with TickerProviderStateMixin {
  Size size = Size.zero;
  late AnimationController _controller;
  late Animation<double> dropPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    dropPosition = Tween<double>(begin: -1, end: 0.6).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1.0, curve: Curves.easeIn),
      ),
    );
    _controller.forward();

    _controller.addListener(() {
      setState(() {});
      if (_controller.value == 1.0) {
        _goToNextPage();
      }
    });
  }

  void _goToNextPage() {
    Navigator.of(context).push(
      FadeRouteBuilder(
        Image.asset(MilkSplashStrings.splash),
        page: const HomeScreen(),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    setState(() {
      size = MediaQuery.of(context).size;
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: Stack(
        children: [
          Center(
            child: Text(
              "Please wait while we\ngather your Baby’s data...",
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge
                  ?.copyWith(fontSize: 18, color: context.themeData.cardColor),
            ),
          ),
          Positioned(
              top: dropPosition.value * size.height,
              left: 0,
              right: 0,
              child: Image.asset(MilkSplashStrings.drop)),
          Positioned(
            left: 0,
            right: 0,
            top: -context.deviceHeight() / 2.3,
            child: Image.asset(MilkSplashStrings.bottle),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: -context.deviceHeight() / 1.15,
            child: Image.asset(MilkSplashStrings.water),
          ),
        ],
      ),
    );
  }
}

class FadeRouteBuilder<T> extends PageRouteBuilder<T> {
  final Widget page;
  final Widget child;

  FadeRouteBuilder(this.child, {required this.page})
      : super(
          pageBuilder: (context, animation1, animation2) => page,
          transitionsBuilder: (context, animation1, animation2, child) {
            return FadeTransition(opacity: animation1, child: child);
            //Image.asset(MilkSplashStrings.splash)
          },
        );
}
