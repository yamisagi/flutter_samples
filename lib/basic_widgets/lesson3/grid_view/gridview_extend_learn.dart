import 'package:flutter/material.dart';

/// * GridView.count ile neredeyse aynı özelliklere sahip bir widget.
/// * Tek bir farkı maxCrossAxisCount değeri vermek zorundayız.
/// * maxCrossAxisCount değeri Grid'in her bir elemanın en fazla x değeri kadar genişliğe ulaşabileceğini belirtiyoruz.

class GridViewExtendLearn extends StatelessWidget {
  const GridViewExtendLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView.extend Kullanımı'),
      ),
      body: GridView.extent(
        /// GridView.count ile bir satır için en fazla kaç eleman istenildiği sayıyı biz belirtirken,
        /// GridView.extend ile verdiğimiz maxCrossAxisCount değeri her bir satıra en fazla kaç eleman gelebileceğini kendi belirler.
        /// Tek fark bu.
        maxCrossAxisExtent: 200,

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
