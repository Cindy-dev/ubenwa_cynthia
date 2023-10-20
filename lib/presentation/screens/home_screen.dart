import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/presentation/utils/home_strings.dart';
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
            children: [
              Container(
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
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
                        CircleAvatar(
                          backgroundColor: context
                              .themeData.colorScheme.secondary
                              .withOpacity(0.5),
                          child: Image.asset(HomeStrings.star),
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
                      padding: const EdgeInsets.only(top: 25, bottom: 26),
                      child: Image.asset(HomeStrings.challenge),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 9),
                      child: Text(
                        "12:40 - 14:30",
                        style: context.textTheme.headlineLarge?.copyWith(
                            color: context.themeData.colorScheme.secondary,
                            fontSize: 21),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          elevation: 4,
                          padding: const EdgeInsets.symmetric(horizontal: 27),
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
                    const SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
