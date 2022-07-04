import 'package:flutter/material.dart';

import 'basic_widgets/lesson2/drop_down_menu/dropdown_example.dart';
import 'basic_widgets/lesson2/drop_down_menu/dropdown_learn.dart';

void main() => runApp(const CourseApp());

class CourseApp extends StatelessWidget {
  const CourseApp({super.key});
  @override
  Widget build(BuildContext context) {
    String title = 'This will take 92 hours.';
    return MaterialApp(
      title: title,
      home: DropdownExample(),
    );
  }
}
