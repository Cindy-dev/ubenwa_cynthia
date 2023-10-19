import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/utils/app_extension.dart';

class HomeOverviewWidget extends StatelessWidget {
  final String title;
  final String trailing;
  final Color trailingColor;
  final Color imageColor;
  final String digit;
  final String image;
  const HomeOverviewWidget(
      {Key? key,
      required this.title,
      required this.digit,
      required this.image,
      required this.trailing,
      required this.trailingColor,
      required this.imageColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
   
        padding:
            const EdgeInsets.only(top: 19, bottom: 15, left: 11, right: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xff132C84),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: imageColor.withOpacity(0.3),
                  child: Image.asset(image),
                ),
                const SizedBox(
                  width: 7,
                ),
                Flexible(
                  child: Text(
                    title,
                    style: context.textTheme.bodySmall?.copyWith(fontSize: 9),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 19, bottom: 15),
              child: Text(
                digit,
                style: context.textTheme.displayLarge?.copyWith(fontSize: 20),
              ),
            ),
            FittedBox(
              child: Text(
                trailing,
                style: context.textTheme.bodySmall
                    ?.copyWith(fontSize: 7, color: trailingColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
