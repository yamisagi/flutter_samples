import 'package:flutter/material.dart';

import 'basic_widgets/lesson4/navigator_learn/navigator_pop_learn.dart';

/// HER LESSON DOSYADA BULUNAN CLASS'I [home] İÇERSİNDE KULLANIP ÖRNEKLERİ GÖREBİLİRSİNİZ.
/// TAMAMLANDIĞINDA TÜM LESSON'LAR İÇİN İSİMLENDİRİLMİŞ ROUTER'LER İLE KULLANIMINI ENTEGRE EDECEĞİM.

void main() => runApp(const CourseApp());

class CourseApp extends StatelessWidget {
  const CourseApp({super.key});
  @override
  Widget build(BuildContext context) {
    String title = 'This will take 92 hours.';
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      title: title,
      home: const NavigatorPopLearn(),
    );
  }
}
