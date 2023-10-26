import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/presentation/utils/get_image_helper.dart';
import 'package:ubenwa_cynthia/presentation/widgets/onboarding_baby_image_widget.dart';
import 'package:ubenwa_cynthia/presentation/widgets/onboarding_widget.dart';
import 'package:ubenwa_cynthia/utils/app_extension.dart';
import '../utils/onboarding_strings.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late PageController _pageController;
  int _currentPosition = 0;
  //allImageAnimationController
  late AnimationController animationController;
  //handles the scaling(bounce in and out) of the baby images during rotation
  late AnimationController scalingAnimationController;
  // handles the rotation positioning
  late Animation<double> animation;
  //handles the centered image opacity during rotation;
  late double imageOpacity;

  @override
  void initState() {
    imageOpacity = 1;
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    scalingAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    // assigning a begin and end value to the rotation animation
    animation =
        Tween<double>(begin: 0, end: pi * 2).animate(animationController);
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    animationController.dispose();
    scalingAnimationController.dispose();
    super.dispose();
  }

  //saves the next stop of the animation controller
  double animationTarget = 0.0;

  //this method handles the baby image rotation
  void _rotateChild({bool forward = true}) {
    setState(() {
      if (forward) {
        animationTarget = animationTarget + 0.25;
      } else {
        animationTarget = animationTarget - 0.25;
      }
      imageOpacity = 0.5;
      animationController.animateTo(animationTarget);
      scalingAnimationController.forward(from: 0);
    });
  }

  double bounceImage(double t,
      {required double start, required double mid, required double end}) {
    return pow(1 - t, 2) * start +
        2 * (1 - t) * t * (mid * 2) +
        pow(t, 2) * end;
  }

  @override
  Widget build(BuildContext context) {
    final image = getImage(_currentPosition);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: context.deviceHeight() / 7,
            left: 30,
            right: 30,
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  left: 0,
                  child: AnimatedOpacity(
                    curve: Curves.fastOutSlowIn,
                    opacity: imageOpacity,
                    duration: const Duration(milliseconds: 300),
                    child: Image.asset(image),
                    onEnd: () {
                      setState(() {
                        imageOpacity = 1.0;
                      });
                    },
                  ),
                ),
                AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: animation.value,
                      child: AnimatedBuilder(
                        animation: scalingAnimationController,
                        builder: (context, ch) {
                          final extent = bounceImage(
                              scalingAnimationController.value,
                              start: 0,
                              mid: 50,
                              end: 0);
                          return Stack(
                            children: [
                              Container(
                                height: context.deviceHeight() / 2.5,
                              ),
                              //using negative to ensure all images are rotating in the right form
                              OnboardingBabyImageWidget(
                                //top baby
                                left: 0,
                                right: 0,
                                top: extent,
                                backgroundColor: colorChange(
                                  2,
                                  context.themeData.colorScheme.secondary,
                                ),
                                angle: -animation.value,
                                babyImage: OnboardingStrings.analytical,
                              ),
                              OnboardingBabyImageWidget(
                                //right baby
                                right: extent,
                                top: 150,
                                backgroundColor: colorChange(
                                  1,
                                  context.primaryColor,
                                ),
                                angle: -animation.value,
                                babyImage: OnboardingStrings.cry,
                              ),
                              OnboardingBabyImageWidget(
                                  //left baby
                                  top: 150,
                                  left: extent,
                                  backgroundColor: colorChange(
                                    3,
                                    context.primaryColor,
                                  ),
                                  angle: -animation.value,
                                  babyImage: OnboardingStrings.happy),
                              OnboardingBabyImageWidget(
                                  //left baby
                                  top: 150,
                                  left: extent,
                                  backgroundColor: colorChange(
                                    3,
                                    context.primaryColor,
                                  ),
                                  angle: -animation.value,
                                  babyImage: OnboardingStrings.happy),
                              OnboardingBabyImageWidget(
                                  //bottom baby
                                  bottom: extent,
                                  right: 0,
                                  left: 0,
                                  backgroundColor: colorChange(
                                    0,
                                    context.themeData.colorScheme.secondary,
                                  ),
                                  angle: -animation.value,
                                  babyImage: OnboardingStrings.baby1),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          PageView(
            controller: _pageController,
            onPageChanged: _updatePosition,
            children: [
              OnboardingWidget(
                currentPosition: _currentPosition,
                title: "Welcome to a New\nMothering Experience",
                subtitle: "Now you can understand a lot about your new born,"
                    " buckle up for an experience you will always long for.",
                pageController: _pageController,
              ),
              OnboardingWidget(
                currentPosition: _currentPosition,
                title: "A Cry with Meaning",
                subtitle: "Now with great feedbacks, you can understand a "
                    "lot about your new born cry patter "
                    "and prepare for common cry peak period",
                pageController: _pageController,
              ),
              OnboardingWidget(
                currentPosition: _currentPosition,
                title: "Analytical Insight",
                subtitle:
                    "Be your baby’s doctor by viewing great insight and analysis;"
                    "you get to see how your baby cry activity varies in terms of "
                    "duration and frequency to help you make good decisions",
                pageController: _pageController,
              ),
              OnboardingWidget(
                currentPosition: _currentPosition,
                title: "Happy Mom\nHappy Home",
                subtitle: "Reduce you baby crying time whilst getting "
                    "your schedule back together by planning for time "
                    "of cry activity and time of quite.",
                pageController: _pageController,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // this method handles color change based on baby position
  Color colorChange(int babyPosition, Color babyColor) {
    int index = _currentPosition;
    if (index == babyPosition) {
      return babyColor;
    } else {
      return babyColor.withOpacity(0.2);
    }
  }

  //updates the page view position and calls rotate
  void _updatePosition(int position) {
    if (_pageController.page! > _currentPosition) {
      _rotateChild();
    } else {
      _rotateChild(forward: false);
    }
    setState(() => _currentPosition = position);
  }
}
