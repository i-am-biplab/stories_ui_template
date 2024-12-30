import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stories/stories/my_story1.dart';
import 'package:stories/stories/my_story2.dart';
import 'package:stories/stories/my_story3.dart';
import 'package:stories/utils/story_bar.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int currentStoryIndex = 0;
  // list of stories
  final List<Widget> myStories = [
    const MyStory1(),
    const MyStory2(),
    const MyStory3(),
  ];

  List<double> percentDone = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < myStories.length; i++) {
      percentDone.add(0);
    }

    _startWatching();
  }

  void _startWatching() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        // only add 0.01 till the percent progress is less than 1
        if (percentDone[currentStoryIndex] + 0.01 < 1) {
          percentDone[currentStoryIndex] += 0.01;
        }

        // if adding 0.01 exceeds 1, set the percent progress to 1 and cancel out the timer
        else {
          percentDone[currentStoryIndex] = 1;
          timer.cancel();

          // move to the next story if available
          if (currentStoryIndex < myStories.length - 1) {
            currentStoryIndex++;
            // restart the story timer
            _startWatching();
          }

          // if on the last story
          else {
            Navigator.pop(context);
          }
        }
      });
    });
  }

  void _onTapDown(TapDownDetails details) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;

    // if user taps on the left half of the screen
    if (dx < screenWidth / 2) {
      setState(() {
        // as long as it's not the first story
        if (currentStoryIndex > 0) {
          // set the previous and current story percent progress back to 0
          percentDone[currentStoryIndex - 1] = 0;
          percentDone[currentStoryIndex] = 0;

          // go to the previous story
          currentStoryIndex--;
        }
      });
    }
    // if the user taps on the right half of the screen
    else {
      // if next story is available
      if (currentStoryIndex < myStories.length - 1) {
        // set the current story percent progress to 1
        percentDone[currentStoryIndex] = 1;
        // move to the next story
        currentStoryIndex++;
      }
      // if on the last story
      else {
        percentDone[currentStoryIndex] = 1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _onTapDown(details),
      child: Scaffold(
        body: Stack(
          children: [
            // Story
            myStories[currentStoryIndex],

            // story viewed progress bar
            StoryBar(
              percentDone: percentDone,
            ),
          ],
        ),
      ),
    );
  }
}
