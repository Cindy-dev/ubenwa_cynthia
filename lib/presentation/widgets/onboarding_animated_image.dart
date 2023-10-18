import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/presentation/utils/onboarding_strings.dart';
import 'package:ubenwa_cynthia/utils/app_extension.dart';

class OnboardingAnimatedImage extends StatefulWidget {
  final PageController pageController;
  final String image;
  final int currentPosition;
  const OnboardingAnimatedImage(
      {Key? key,
      required this.image,
      required this.pageController,
      required this.currentPosition})
      : super(key: key);

  @override
  State<OnboardingAnimatedImage> createState() =>
      _OnboardingAnimatedImageState();
}

class _OnboardingAnimatedImageState extends State<OnboardingAnimatedImage>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late Tween<double> slideAnimation;
  bool isSwiping = false;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation =
        Tween<double>(begin: 0, end: pi / 2).animate(animationController);
    slideAnimation = Tween<double>(begin: 0, end: 100);

    widget.pageController.addListener(() {
      animationController.forward(from: 0);
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _rotateChild() {
    setState(() {
      animationController.forward(from: 0);
    });
  }

  double bounce2(double t,
      {required double start, required double mid, required double end}) {
    return pow(1 - t, 2) * start +
        2 * (1 - t) * t * (mid * 2) +
        pow(t, 2) * end;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (direction) {
        if (direction.delta.dx < 0 && widget.currentPosition < 3) {
          // Right Swipe
          _rotateChild();
          isSwiping = true;
          widget.pageController.nextPage(
              duration: const Duration(milliseconds: 10),
              curve: Curves.easeInOut);
        } else if (direction.delta.dx > 0 && widget.currentPosition > 0) {
          //Left Swipe
          _rotateChild();
          isSwiping = true;
          widget.pageController.previousPage(
              duration: const Duration(milliseconds: 10),
              curve: Curves.easeInOut);
        }
      },
      onHorizontalDragEnd: (direction) {
        // Stop rotating the image when the user stops swiping
        isSwiping = false;
      },
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            child: Image.asset(widget.image),
          ),
          AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget? child) {
              final extent =
                  bounce2(animationController.value, start: 0, mid: 50, end: 0);
              return Transform.rotate(
                angle: animation.value,
                child: Stack(
                  children: [
                    Container(
                      height: context.deviceHeight() / 2.5,
                    ),
                    //using negative to ensure all images are rotating in the right form
                    Positioned(
                      //top baby
                      left: 0,
                      right: 0,
                      top: extent,
                      child: Transform.rotate(
                        angle: -animation.value,
                        child: CircleAvatar(
                          radius: 30,
                          child: Image.asset(OnboardingStrings.analytical),
                        ),
                      ),
                    ),
                    Positioned(
                      //right baby
                      right: extent,
                      top: 150,
                      child: Transform.rotate(
                        angle: -animation.value,
                        child: CircleAvatar(
                            radius: 30,
                            child: Image.asset(OnboardingStrings.cry)),
                      ),
                    ),
                    Positioned(
                      //left baby
                      top: 150,
                      left: extent,
                      child: Transform.rotate(
                        angle: -animation.value,
                        child: CircleAvatar(
                            radius: 30,
                            child: Image.asset(OnboardingStrings.happy)),
                      ),
                    ),
                    Positioned(
                      //bottom baby
                      bottom: extent,
                      right: 0,
                      left: 0,
                      child: Transform.rotate(
                        angle: -animation.value,
                        child: CircleAvatar(
                          radius: 30,
                          child: Image.asset(OnboardingStrings.baby1),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
