import 'package:flutter/material.dart';
import 'package:stories/pages/story_page.dart';
import 'package:stories/utils/story_circle.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _openStory() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const StoryPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        title: const Text("S T O R I E S"),
        centerTitle: true,
        backgroundColor: Colors.purple.shade500,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: 9,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return StoryCircle(
                    onTap: _openStory,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
