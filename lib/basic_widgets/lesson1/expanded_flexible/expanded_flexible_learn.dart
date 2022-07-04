import 'package:flutter/material.dart';

class ExpandedFlexibleLearn extends StatelessWidget {
  const ExpandedFlexibleLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible ve Expanded Kullanımı'),
      ),
      body: Row(
        children: [
          /// * Basitçe Flexible ve Expanded OverFlow hataları yani ekrandan taşma hataları için kullanılır genellikle.
          /// * Expanded için çoğunlukla height ve width değerleri verilse de,
          /// * O değerleri göz önünden bulundurmaz ve yayılabileceği kadar alana yayılır.
          /// * Flexible içinse tersine içinde bulunduğu widget'in alanına göre hareket eder.
          /// * İkisi için de ortak olarak flex değeri verilebilir.
          /// * Bu da verilen child'ların ortalama alanına göre daha büyük veya küçük olarak yer kaplamasını sağlar.
          Expanded(
            flex: 6,
            child: Container(
              height: 100,
              color: Colors.red,
              child: const Text('Expanded'),
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              height: 100,
              color: Colors.green,
              child: const Text('Flexible'),
            ),
          ),
        ],
      ),
    );
  }
}
