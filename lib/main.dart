import 'package:flutter/material.dart';

import 'basic_widgets/lesson3/card_listtile/card_listtile_learn.dart';

void main() => runApp(const CourseApp());

class CourseApp extends StatelessWidget {
  const CourseApp({super.key});
  @override
  Widget build(BuildContext context) {
    String title = 'This will take 92 hours.';
    return MaterialApp(
      title: title,
      home: const CardListTileLearn(),
    );
  }
}
