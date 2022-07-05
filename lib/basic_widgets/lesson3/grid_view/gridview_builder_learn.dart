import 'package:flutter/material.dart';

/// * Daha önceki örneklerden farklı olarak GridView.builder bizdeni
/// 1 - gridDelagete [SliverGridDelagate] abstract sınıfından türetilmiş bir widget bekliyor,
/// Biz bu örnekte [SliverGridDelegateWithFixedCrossAxisCount] kullanacağız

class GridViewBuilderLearn extends StatelessWidget {
  const GridViewBuilderLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView.builder Kullanımı'),
      ), 
      body: GridView.builder(
        /// Burda ilk dikkat çeken kısım [itemCount] değeri, 
        /// Bu değer GridView'in kaç elemanın olmasını istediğimizi belirler. Ve opsiyoneldir.
        itemCount: 100,
        /// Ve daha sonra [gridDelagate] parametresi ile [SliverGridDelagate] abstract sınıfından türetilmiş bir widget bekliyor,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          /// [SliverGridDelegateWithFixedCrossAxisCount] tıpkı [GridView.count] ile aynı şekilde bizden
          /// [crossAxisCount] değeri istiyor. Yani bir satırda kaç adet Grid elemanı olacağını belirtiyoruz.
          crossAxisCount: 3,
        ),
        /// Ve ikinci olarak bizden zorunlu olarak [itemBuilder] bekliyor,
        /// Bu parametre ile tıpkı [ListViewBuilderLearn] örneğindeki [itemBuilder] parametresi ile aynı şekilde çalışır.
        /// Bizden bir [context] parametresi ve [index] parametresi bekliyor.
        /// Daha önce de anlattığımız üzere [BuildContextLearn] kısmından tekrar ederek [context] yapısının ne işe yaradığına bakabiliriz.
        itemBuilder: (context, index) {
          return Card(
            color: Colors.red[100 * (index % 10)],
            child: Center(
              child: Text('Card $index'),
            ),
          );
        },
      ),
    );
  }
}
