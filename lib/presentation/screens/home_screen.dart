import 'package:flutter/material.dart';
import 'package:ubenwa_cynthia/presentation/utils/home_strings.dart';
import 'package:ubenwa_cynthia/presentation/widgets/home_overview_widget.dart';
import 'package:ubenwa_cynthia/utils/app_extension.dart';

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
          HomeOverviewWidget()
        ],
      ),
    );
  }
}
