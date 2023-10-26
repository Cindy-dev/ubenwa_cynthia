import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/presentation/utils/home_strings.dart';
import 'package:ubenwa_cynthia/presentation/widgets/alarm_sheet.dart';
import 'package:ubenwa_cynthia/utils/app_extension.dart';
import '../widgets/overview_row_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          "Cry Records",
          style: context.textTheme.headlineLarge?.copyWith(fontSize: 18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Image.asset(HomeStrings.bell),
          )
        ],
      ),
      body: ListView(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime(2019, 1, 15),
            lastDate: DateTime(2090, 1, 15),
            onDateSelected: (date) {},
            leftMargin: 20,
            monthColor: Colors.blueGrey,
            dayTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
            locale: 'en_ISO',
            activeBackgroundDayColor: const Color(0xff4476F6),
          ),
          const OverviewRowWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 26, bottom: 14, left: 25),
            child: Text(
              "Hourly Breakdown",
              style: context.textTheme.titleMedium?.copyWith(
                fontSize: 13,
                color: context.themeData.colorScheme.tertiary.withOpacity(0.8),
              ),
            ),
          ),
          Image.asset(
            HomeStrings.breakdown,
            fit: BoxFit.cover,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(vertical: 30) +
                      const EdgeInsets.only(left: 25),
                  padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: context.themeData.shadowColor.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: CircleAvatar(
                              backgroundColor: context
                                  .themeData.colorScheme.secondary
                                  .withOpacity(0.5),
                              child: Image.asset(HomeStrings.star),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Daily Challenge",
                            style: context.textTheme.titleMedium,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: context.deviceWidth() / 30,
                            bottom: context.deviceWidth() / 50),
                        child: Image.asset(HomeStrings.challenge),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Flexible(
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(vertical: 30) +
                      const EdgeInsets.only(right: 28),
                  padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
                  decoration: BoxDecoration(
                    color: context.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: context.primaryColor,
                    ),
                  ),
                  child: Column(
                    children: [
                      Image.asset(HomeStrings.predictCry),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Next Predicted Cry",
                        style: context.textTheme.titleMedium?.copyWith(
                            color: context.themeData.cardColor, fontSize: 11),
                      ),
                      Text(
                        "12:40 - 14:30",
                        style: context.textTheme.headlineLarge?.copyWith(
                            color: context.themeData.colorScheme.secondary,
                            fontSize: context.deviceWidth() > 430 ? 21 : 17),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          alarmSheet(context);
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(99, 23),
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor:
                                context.themeData.cardColor.withOpacity(0.71)),
                        child: Text(
                          "Set Alarm",
                          style: context.textTheme.titleMedium?.copyWith(
                              color: context.primaryColor, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
