import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/presentation/utils/get_image_helper.dart';
import 'package:ubenwa_cynthia/presentation/utils/onboarding_strings.dart';
import 'package:ubenwa_cynthia/utils/app_extension.dart';
import 'onboarding_baby_image_widget.dart';

class OnboardingAnimatedImage extends StatefulWidget {
  final AnimationController scalingAnimationController;
  final AnimationController animationController;
  final Animation<double> animation;
  final int currentPosition;
  double imageOpacity;

  OnboardingAnimatedImage(
      {Key? key,
      required this.scalingAnimationController,
      required this.animationController,
      required this.animation,
      required this.currentPosition,
      required this.imageOpacity})
      : super(key: key);

  @override
  State<OnboardingAnimatedImage> createState() =>
      _OnboardingAnimatedImageState();
}

class _OnboardingAnimatedImageState extends State<OnboardingAnimatedImage> {
  double imageBounce(double t,
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
        // if (direction.delta.dx < 0) {
        //   // Right Swipe
        //   _pageController.nextPage(
        //       duration: const Duration(milliseconds: 10),
        //       curve: Curves.easeInOut);
        // } else if (direction.delta.dx > 0) {
        //   //Left Swipe
        //   _pageController.previousPage(
        //       duration: const Duration(milliseconds: 10),
        //       curve: Curves.easeInOut);
        // }
      },
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            child: AnimatedOpacity(
              curve: Curves.fastOutSlowIn,
              opacity: widget.imageOpacity,
              duration: const Duration(milliseconds: 300),
              child: Image.asset(image),
              onEnd: () {
                setState(() {
                  widget.imageOpacity = 1.0;
                });
              },
            ),
          ),
          AnimatedBuilder(
            animation: widget.animationController,
            builder: (context, child) {
              return Transform.rotate(
                angle: widget.animation.value,
                child: AnimatedBuilder(
                  animation: widget.scalingAnimationController,
                  builder: (context, ch) {
                    final extent = imageBounce(
                        widget.scalingAnimationController.value,
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
                          angle: -widget.animation.value,
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
                          angle: -widget.animation.value,
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
                            angle: -widget.animation.value,
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
                            angle: -widget.animation.value,
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

// OnboardingAnimatedImage(
// imageOpacity: imageOpacity,
// scalingAnimationController: scalingAnimationController,
// animationController: animationController,
// animation: animation,
// currentPosition: _currentPosition,
// ),
