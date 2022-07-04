import 'package:flutter/material.dart';

/// * ListView bizden SingleChildScrollView'ın aksine direkt olarak bir liste bekliyor,
/// * Bu yüzden aynı yöntemle burda bir yapı oluşturabiliriz.
/// * Fakat ListView için söylenmesi gereken bir konuda,
/// * İçerisinde 10-20 gibi az sayıda eleman varsa performans açısından bir problem yok ama,
/// * İçerisine ne kadar itemin geleceği belli değilse bu Widget'i kullanmak performans sorunlarına neden olur,
/// * Bunun nedeni ise içerisindeki itemleri sürekli 'Alive' statette tutar ve bellekte sürekli yer kaplar.

class ListViewLearn extends StatelessWidget {
  const ListViewLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///  * Burda bize 500 elemanlı bir model liste oluşturuyoruz.
    /// * Daha sonra bunu map() methodu ile ListView içerisinde kullanacağız.
    final List<Person> items = List.generate(
      500,
      (index) => Person(
        name: '${index + 1}',
        age: index > 50 ? index ~/ 10 : index + 10,
        job: "Unknown",
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Kullanımı'),
      ),
      body: ListView(
        /// Yukarıda oluşturduğumuz listeyi ListView'ın içerisine .map() methodu ile ekliyoruz.
        /// Ve bize içerisinde 500 adet item bulunan bir scrollable yapı oluşuyor.
        /// Tekrardan hatırlatmakta fayda var, bu çok fazla elemanı bulunan yapılar için bellek düşmanıdır.
        children: items
            .map((Person e) => Card(
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(e.name),
                    subtitle: Text(e.age.toString()),
                    trailing: Text(e.job),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

/// * Bir model sınıfı oluşturduk ve bu modeli liste içinde kullanacağız.
class Person {
  final String name;
  final int age;
  final String job;
  const Person({
    required this.name,
    required this.age,
    required this.job,
  });
}
