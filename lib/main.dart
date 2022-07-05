import 'package:flutter/material.dart';

import 'basic_widgets/lesson3/grid_view/gridview_count_learn.dart';

/// HER LESSON DOSYADA BULUNAN CLASS'I [home] İÇERSİNDE KULLANIP ÖRNEKLERİ GÖREBİLİRSİNİZ.
/// TAMAMLANDIĞINDA TÜM LESSON'LAR İÇİN İSİMLENDİRİLMİŞ ROUTER'LER İLE KULLANIMINI ENTEGRE EDECEĞİM.

void main() => runApp(const CourseApp());

class CourseApp extends StatelessWidget {
  const CourseApp({super.key});
  @override
  Widget build(BuildContext context) {
    String title = 'This will take 92 hours.';
    return MaterialApp(
      title: title,
      home: const GridViewLearn(),
    );
  }
}
