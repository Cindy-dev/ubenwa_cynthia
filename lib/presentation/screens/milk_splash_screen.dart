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
  Color? backgroundColor;
  late AnimationController _milkDropController;
  Animation<double>? dropPosition;
  late AnimationController _milkSplashController;
  Animation<double>? _animationSplash;

  @override
  void initState() {
    _milkDropController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    //handles the splash effect
    _milkSplashController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    Future.microtask(playAnimation);
    super.initState();
  }

  playAnimation() {
    const double bottleHeight = 100;
    //handles the drop of the milk
    dropPosition = Tween<double>(
            begin: bottleHeight, end: context.deviceHeight() - bottleHeight)
        .animate(
      CurvedAnimation(
        parent: _milkDropController,
        curve: const Interval(0, 1.0, curve: Curves.easeIn),
      ),
    );

    //handles the animating points for the splash controller
    _animationSplash = Tween<double>(
      begin: 0,
      end: -(context.deviceHeight() * 1.62),
    ).animate(_milkSplashController);

    //listens to changes in the milk drop controller
    _milkDropController.addListener(() {
      setState(() {});
      if (_milkDropController.value == 1.0) {
        _milkSplashController.forward();
      }
    });
    //listens to changes in the milk splash controller
    _milkSplashController.addListener(() {
      setState(() {});
      if (_milkSplashController.isCompleted) {
        backgroundColor = context.themeData.cardColor;
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return HomeScreen();
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      }
    });

    //forward drop animation
    _milkDropController.forward();
  }

  @override
  void dispose() {
    _milkSplashController.dispose();
    _milkDropController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? context.primaryColor,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
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
            top: 0,
            child: Transform.translate(
              offset: Offset(0, (dropPosition?.value ?? 0)),
              child: Image.asset(MilkSplashStrings.drop),
            ),
          ),
          Positioned(
            top: 0,
            child: Image.asset(MilkSplashStrings.bottle),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: -context.deviceHeight() / 1.15,
            child: Image.asset(MilkSplashStrings.water),
          ),
          Positioned(
            top: context.deviceHeight(),
            left: 0,
            right: 0, // Right edge
            child: Transform.translate(
              offset: Offset(0, (_animationSplash?.value ?? 0)),
              child: SizedBox(
                width: context.deviceWidth() + 100,
                child: Image.asset(
                  MilkSplashStrings.splash,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
