import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/presentation/utils/get_image_helper.dart';
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
  late AnimationController scalingAnimationController;
  late Animation<double> animation;
  late Tween<double> slideAnimation;
  late double imageOpacity;

  @override
  void initState() {
    imageOpacity = 1;
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    //handles scaling of babies during rotation
    scalingAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation =
        Tween<double>(begin: 0, end: pi * 2).animate(animationController);
    widget.pageController.addListener(() {
      if (widget.pageController.page! > widget.currentPosition) {
        _rotateChild();
      } else {
        _rotateChild(forward: false);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.pageController.dispose();
    animationController.dispose();
    scalingAnimationController.dispose();
    super.dispose();
  }

  //saves the next stop of the animation controller
  double animationTarget = 0.0;

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

  double bounce2(double t,
      {required double start, required double mid, required double end}) {
    return pow(1 - t, 2) * start +
        2 * (1 - t) * t * (mid * 2) +
        pow(t, 2) * end;
  }

  @override
  Widget build(BuildContext context) {
    final image = getImage(widget.currentPosition);
    return GestureDetector(
      onHorizontalDragUpdate: (direction) {
        if (direction.delta.dx < 0) {
          // Right Swipe
          widget.pageController.nextPage(
              duration: const Duration(milliseconds: 10),
              curve: Curves.easeInOut);
        } else if (direction.delta.dx > 0) {
          //Left Swipe
          widget.pageController.previousPage(
              duration: const Duration(milliseconds: 10),
              curve: Curves.easeInOut);
        }
      },
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
                      final extent = bounce2(scalingAnimationController.value,
                          start: 0, mid: 50, end: 0);
                      return Stack(
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
                                backgroundColor: colorChange(
                                  2,
                                  context.themeData.colorScheme.secondary,
                                ),
                                child:
                                    Image.asset(OnboardingStrings.analytical),
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
                                  backgroundColor: colorChange(
                                    1,
                                    context.primaryColor,
                                  ),
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
                                  backgroundColor: colorChange(
                                    3,
                                    context.primaryColor,
                                  ),
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
                                backgroundColor: colorChange(
                                  0,
                                  context.themeData.colorScheme.secondary,
                                ),
                                child: Image.asset(OnboardingStrings.baby1),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              );
            },
          ),
        ],
      ),
    );
  }

  Color colorChange(int babyPosition, Color babyColor) {
    int index = widget.currentPosition;
    if (index == babyPosition) {
      return babyColor;
    } else {
      return babyColor.withOpacity(0.2);
    }
  }
}
