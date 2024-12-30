import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

// ignore: must_be_immutable
class MyProgressBar extends StatelessWidget {
  double percentDone = 0;

  MyProgressBar({super.key, required this.percentDone});

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 3,
      percent: percentDone,
      progressColor: Colors.grey.shade200,
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
    );
  }
}
