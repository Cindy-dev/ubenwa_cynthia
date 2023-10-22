import 'package:flutter/material.dart';

class OnboardingBabyImageWidget extends StatelessWidget {
  double? right;
  double? left;
  double? top;
  double? bottom;
  final double angle;
  final Color backgroundColor;
  final String babyImage;
  OnboardingBabyImageWidget(
      {Key? key,
      this.right,
      this.bottom,
      this.left,
      this.top,
      required this.backgroundColor,
      required this.angle,
      required this.babyImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      left: left,
      top: top,
      bottom: bottom,
      child: Transform.rotate(
        angle: angle,
        child: CircleAvatar(
          radius: 30,
          backgroundColor: backgroundColor,
          child: Image.asset(babyImage),
        ),
      ),
    );
  }
}
