import 'package:flutter/material.dart';

/// * GridView ListView ile neredeyse aynı özelliklere sahip bir widget.
/// * Bize Grid'ler şeklinde bir görünüm sunar.
/// * En çok kullanılanlardan GridView.count ile başlamak gerekirse,

class GridViewLearn extends StatelessWidget {
  const GridViewLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView.count Kullanımı'),
      ),
      body: GridView.count(
        /// crossAxisCount ile Grid'in bir satırda en fazla kaç eleman istenildiği sayıyı belirliyoruz.
        crossAxisCount: 3,

        /// crossAxisSpacing ile Grid'in her bir elemanın arasında boşluk bırakılmasını sağlıyoruz.
        crossAxisSpacing: 10,

        /// mainAxisSpacing ile Grid'in her bir satırın arasında boşluk bırakılmasını sağlıyoruz.
        /// ! Dikkat: mainAxisSpacing ile crossAxisSpacing, scrollDirection ile farklılık gösterebilir,
        /// Yani default olarak scrollDirection = Axis.vertical olduğundan crossAxis - Yatay
        /// -------------------------------------------------------------- mainAxis - Dikeydir.
        /// Eğer scrollDirection = Axis.horizontal olarak değiştirirsek, mainAxis - Yatay, crossAxis - Dikey olacaktır.
        mainAxisSpacing: 30,
        /// Padding ise Grid'in en kenarlarında boşluk bırakılmasını sağlar bildiğimiz üzere.
        padding: const EdgeInsets.all(10),
        children: [
          /// Son olarak elemanların width ve height değerlerini vermiyoruz, bunu kendi belirliyor.
          Card(
            color: Colors.red.shade100,
            child: const Center(child: Text('Card 1')),
          ),
          Card(
            color: Colors.red.shade100,
            child: const Center(child: Text('Card 2')),
          ),
          Card(
            color: Colors.red.shade100,
            child: const Center(child: Text('Card 3')),
          ),
          Card(
            color: Colors.red.shade100,
            child: const Center(child: Text('Card 4')),
          ),
        ],
      ),
    );
  }
}
