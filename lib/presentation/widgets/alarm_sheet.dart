import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/utils/app_extension.dart';
import 'alarm_settings_row.dart';

alarmSheet(BuildContext context) {
  return showCupertinoModalPopup(
    context: context,
    barrierColor: context.colors.black.withOpacity(0.5),
    builder: (BuildContext context) {
      bool switchValue = false;
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: context.themeData.colorScheme.tertiary,
        ),
        margin: EdgeInsets.only(top: context.deviceHeight() / 15),
        padding: const EdgeInsets.symmetric(horizontal: 24) +
            const EdgeInsets.only(top: 10, bottom: 46),
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Cancel",
                        style: context.textTheme.titleLarge?.copyWith(
                            color: context.themeData.colorScheme.secondary),
                      ),
                    ),
                    Text(
                      "Edit Alarm",
                      style: context.textTheme.headlineLarge?.copyWith(
                          fontSize: 16, color: context.themeData.cardColor),
                    ),
                    Text(
                      "Save",
                      style: context.textTheme.titleLarge?.copyWith(
                          color: context.themeData.colorScheme.secondary),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.deviceHeight() * 0.25,
                  child: CupertinoTheme(
                    data: CupertinoThemeData(
                      //barBackgroundColor: context.themeData.cardColor,
                      textTheme: CupertinoTextThemeData(
                        dateTimePickerTextStyle: context.textTheme.headlineMedium
                            ?.copyWith(color: context.themeData.cardColor),
                      ),
                    ),
                    child: CupertinoDatePicker(
                      //  backgroundColor: context.themeData.cardColor,
                      mode: CupertinoDatePickerMode.time,
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (DateTime newDateTime) {
                        // setState(() {
                        // _dateTime = newDateTime;
                        // });
                      },
                    ),
                  ),
                ),
                Card(
                  color:    context.themeData.cardColor.withOpacity(0.02),
                    margin: const EdgeInsets.only(top: 5),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: context.themeData.cardColor.withOpacity(0.05),
                    ),
                    child: Column(children: [
                      const AlarmSettingsRow(
                        title: "Repeat",
                        status: "Never",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 12),
                        child: Divider(
                          color: context.themeData.cardColor.withOpacity(0.05),
                        ),
                      ),
                      const AlarmSettingsRow(
                        title: "Label",
                        status: "Alarm",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 12),
                        child: Divider(
                          color: context.themeData.cardColor.withOpacity(0.05),
                        ),
                      ),
                      const AlarmSettingsRow(
                        title: "Sound",
                        status: "Circuit",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 12),
                        child: Divider(
                          color: context.themeData.cardColor.withOpacity(0.05),
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
                          CupertinoSwitch(value: switchValue, onChanged: (val) {
                            setState(()=>
                              switchValue = !switchValue);
                          }),
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
                    minimumSize: const Size(double.maxFinite, 48),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: context.themeData.cardColor.withOpacity(0.05),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Delete Alarm",
                    style: context.textTheme.bodyLarge?.copyWith(color: Colors.red),
                  ),
                )
              ],
            );
          }
        ),
      );
    },
  );
}
