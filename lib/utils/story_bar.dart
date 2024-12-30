import 'package:flutter/material.dart';
import 'package:stories/utils/my_progress_bar.dart';

// ignore: must_be_immutable
class StoryBar extends StatelessWidget {
  List<double> percentDone = [];

  StoryBar({super.key, required this.percentDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60, left: 4, right: 4),
      child: Row(
        children: [
          Expanded(
            child: MyProgressBar(percentDone: percentDone[0]),
          ),
          Expanded(
            child: MyProgressBar(percentDone: percentDone[1]),
          ),
          Expanded(
            child: MyProgressBar(percentDone: percentDone[2]),
          ),
        ],
      ),
    );
  }
}
