import 'package:flutter/material.dart';

class BuildContextLearn extends StatefulWidget {
  const BuildContextLearn({Key? key}) : super(key: key);

  @override
  State<BuildContextLearn> createState() => _BuildContextLearnState();
}

class _BuildContextLearnState extends State<BuildContextLearn> {
  /// * Flutter'da Stateless veya Stateful Widget'ların State'leri,
  /// * BuildContext yapısı ile ilişkilendirilir.
  /// * build(BuildContext context) şeklinde widget içerisinde kullanılır.
  /// * Yapı itibariyle Flutter Widget-Tree mantığıyla çalıştığı için yukarıdan aşağı şekilde bu context'ler ile haberleşirler.
  /// * Ve context'ler hangi Widget'in nereye konulacağına kadar her bilgi için sorumludur.
  @override
  Widget build(BuildContext context) {
    /// * Burdaki context main.dart dasyasındaki MaterialApp widget'ının context'i ile haberleşiyor şeklinde düşünebiliriz.
    /// * Ve bilgi akışı da MaterialApp context --> BuildContextLearn context. Şeklinde haberleşiyor. 
    return Scaffold(
      appBar: AppBar(
        title: Text('BuildContext Kullanımı'),
      ),
      body: Container(),
    );
  } 
}
