import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/utils/app_extension.dart';

import '../utils/home_strings.dart';
import 'home_overview_widget.dart';

class OverviewRowWidget extends StatelessWidget {
  const OverviewRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today’s Overview",
            style: context.textTheme.titleMedium?.copyWith(
              fontSize: 13,
              color: context.themeData.colorScheme.tertiary.withOpacity(0.8),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            children: [
              HomeOverviewWidget(
                title: "Number of Cry Episode",
                digit: "45",
                trailing: "20% better than yesterday",
                image: HomeStrings.sun,
                imageColor: context.primaryColor,
                trailingColor: context.colors.green,
              ),
              const SizedBox(
                width: 16,
              ),
              HomeOverviewWidget(
                title: "Longest Cry Duration",
                digit: "30mins",
                trailing: "20% worst than yesterday",
                image: HomeStrings.wifi,
                imageColor: context.themeData.colorScheme.secondary,
                trailingColor: context.themeData.colorScheme.error,
              ),
              const SizedBox(
                width: 16,
              ),
              HomeOverviewWidget(
                title: "Cumulative Cry Duration",
                digit: "4hours",
                trailing: "20% better than yesterday",
                image: HomeStrings.chart,
                imageColor: context.colors.purple,
                trailingColor: context.colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
