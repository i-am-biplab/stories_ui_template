import 'package:flutter/material.dart';

class StoryCircle extends StatelessWidget {
  final Function()? onTap;

  const StoryCircle({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.purple.shade300,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
