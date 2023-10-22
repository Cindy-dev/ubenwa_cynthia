import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/utils/app_extension.dart';
import 'alarm_settings_row.dart';

alarmSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        padding: const EdgeInsets.symmetric(horizontal: 24) +
            const EdgeInsets.only(top: 36, bottom: 46),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cancel",
                  style: context.textTheme.titleLarge?.copyWith(
                      color: context.themeData.colorScheme.secondary),
                ),
                Text(
                  "Edit Alarm",
                  style:
                      context.textTheme.headlineLarge?.copyWith(fontSize: 16),
                ),
                Text(
                  "Save",
                  style: context.textTheme.titleLarge?.copyWith(
                      color: context.themeData.colorScheme.secondary),
                ),
              ],
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime newDateTime) {
                  // setState(() {
                  // _dateTime = newDateTime;
                  // });
                },
              ),
            ),
            Card(
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: context.themeData.colorScheme.tertiary),
                child: Column(children: [
                  const AlarmSettingsRow(
                    title: "Repeat",
                    status: "Never",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 12),
                    child: Divider(
                      color: context.themeData.cardColor.withOpacity(0.7),
                    ),
                  ),
                  const AlarmSettingsRow(
                    title: "Label",
                    status: "Alarm",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 12),
                    child: Divider(
                      color: context.themeData.cardColor.withOpacity(0.7),
                    ),
                  ),
                  const AlarmSettingsRow(
                    title: "Sound",
                    status: "Circuit",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 12),
                    child: Divider(
                      color: context.themeData.cardColor.withOpacity(0.7),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Snooze",
                        style: context.textTheme.headlineLarge?.copyWith(
                            fontSize: 16, color: context.themeData.cardColor),
                      ),
                      CupertinoSwitch(value: true, onChanged: (val) {}),
                    ],
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: context.deviceWidth() / 4, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor:
                    context.themeData.colorScheme.tertiary.withOpacity(0.8),
              ),
              onPressed: () {},
              child: Text(
                "Delete Alarm",
                style: context.textTheme.bodyLarge?.copyWith(color: Colors.red),
              ),
            )
          ],
        ),
      );
    },
  );
}
