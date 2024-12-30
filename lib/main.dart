import 'package:flutter/material.dart';
import 'package:stories/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Stories',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}