import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/utils/app_extension.dart';

class AlarmSettingsRow extends StatelessWidget {
  final String title;
  final String status;
  const AlarmSettingsRow({
    super.key,
    required this.title,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textTheme.headlineLarge
              ?.copyWith(fontSize: 16, color: context.themeData.cardColor),
        ),
        Row(
          children: [
            Text(
              status,
              style: context.textTheme.titleLarge?.copyWith(
                fontSize: 14,
                color: context.themeData.cardColor.withOpacity(0.7),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 10,
              color: context.themeData.cardColor.withOpacity(0.7),
            )
          ],
        ),
      ],
    );
  }
}
