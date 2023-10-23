import 'package:flutter/material.dart';
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
  double splashPosition = -10;

  late final AnimationController _milkSplashController ;
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset(-1.0, 1.0), // Start at bottom left
    end: Offset(1.0, -1.0),
  ).animate(CurvedAnimation(
    parent: _milkSplashController,
    curve: Curves.easeIn,
  ));
  // late final Animation<double> _offsetAnimation =
  //     Tween<double>(begin: splashPosition , end: 1.0).animate(CurvedAnimation(
  //   parent: _milkSplashController,
  //   curve: Curves.easeIn,
  // ));

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
   _milkSplashController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );

    // _milkSplashController.forward();
    // Navigator.of(context).push(
    //   FadeRouteBuilder(
    //     Image.asset(MilkSplashStrings.splash),
    //     page: const HomeScreen(),
    //   ),
    // );
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
    // _milkSplashController.dispose();
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
            child: Image.asset(MilkSplashStrings.drop),
          ),
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
          // AnimatedPositioned(
          //   duration: Duration(seconds: 2),
          //   curve: Curves.easeOut,
          //   child: Image.asset(MilkSplashStrings.splash),
          // )
        ],
      ),
    );
  }
}
