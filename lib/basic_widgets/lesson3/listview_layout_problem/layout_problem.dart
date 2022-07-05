import 'package:flutter/material.dart';

/// * Basitçe bir Column içerisine bir listview ekleyerek, aslında direkt olarak hatayı görüyoruz.
/// ! "Vertical viewport was given unbounded height."
/// * Burda problem bir Column() widgetimiz var ve içerisine bir ListView() ekledik.
/// * Column() yapı olarak içerisine alabileceği kadar Widget türünden nesneler alır fakat "size" değerlerini bilmek zorunda.
/// * Burda problem yok.
/// * Ama ListView() sonsuza kadar yer kaplayabileceği için "size" değeri yok.
/// * Bu durum adından anlaşılacağı üzere,
/// * "..unbounded height." yani sınırı belli olmayan yükseklik nedeniyle bize hata veriyor.
/// * Çözüm olarak yükseklik değerleri belli iki widget arasına Expanded şekilde konumlandırabiliriz.
class ListViewLayoutProblem extends StatelessWidget {
  const ListViewLayoutProblem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List item = List.generate(
        100,
        (index) => Container(
              color: index % 2 == 0 ? Colors.red.shade200 : Colors.white10,
              height: 50,
              child: Center(
                  child: Text(
                'Item $index',
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
            ));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Problemi'),
      ),
      body: Column(
        children: [
          Card(
            color: Colors.red.shade100,
            child: const ListTile(
                title: Center(
              child: Text(
                'This is Beginning!',
              ),
            )),
          ),
          Expanded(
            child: ListView(
              children: [
                ...item,
              ],
            ),
          ),
          Card(
            color: Colors.red.shade100,
            child: const ListTile(
                title: Center(
              child: Text(
                'This is end!',
              ),
            )),
          ),
        ],
      ),
    );
  }
}
