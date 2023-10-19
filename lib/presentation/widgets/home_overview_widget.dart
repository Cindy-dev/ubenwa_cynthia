import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/presentation/utils/home_strings.dart';
import 'package:ubenwa_cynthia/utils/app_extension.dart';

class HomeOverviewWidget extends StatelessWidget {
  const HomeOverviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 19, bottom: 15, left: 11, right: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xff132C84),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                  backgroundColor: context.primaryColor.withOpacity(0.7),
                  child: Image.asset(HomeStrings.sun)),
              Text(
                "Number\nof Cry Episode",
                style: context.textTheme.bodySmall?.copyWith(fontSize: 9),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 19, bottom: 15),
            child: Text(
              "45",
              style: context.textTheme.displayLarge?.copyWith(fontSize: 20),
            ),
          ),
          Text(
            "20% better than yesterday",
            style: context.textTheme.bodySmall?.copyWith(
                fontSize: 7, color: context.themeData.colorScheme.error),
          ),
        ],
      ),
    );
  }
}
