import 'package:flutter/material.dart';

/// * ListView.builder() tıpkı ListView gibi aynı özelliklere sahiptir.
/// * Fakat büyük boyutlu listeler, elemanlar ile çalışırken daha performanslı çalışır.
/// * Bunun nedeni ise içerisindeki builder her bir render edeceği eleman için teker teker çalışır,
/// * Ve bu da kullanılmayan elemanların bellekte yer kaplamamasına, ekranda görüneceği zaman builder ile oluşturulmasına neden olur.

class ListViewBuilderLearn extends StatelessWidget {
  const ListViewBuilderLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Tekrardan bir model liste oluşturuyoruz.
    List<Student> items = List.generate(
      500,
      (index) => Student(
        name: '${index + 1}',
        age: index > 50 ? index ~/ 10 : index + 10,
        grade: index % 2 == 0 ? true : false,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Builder Kullanımı'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          /// Önce çirkin bir görüntü olmaması için item listemizin o anki indexisini bir değişkende tutuyoruz.
          Student student = items[index];
          return Card(
            /// Bu şekilde bir kullanım ile efektif bir şekilde ListView.builder() kullanımı yapılabilir.
            /// -------------------------------------------------------------------------------------------
            /// Card Widgetin Color'unu grade Student class'tan türettiğimiz nesnenin grade property'si true ise yeşil değilse kırmızı olarak ayarlıyoruz.
            color: student.grade ? Colors.green.shade100 : Colors.red.shade100,
            child: ListTile(
              leading: const Icon(Icons.person),

              /// O anki indexin adı
              title: Text(student.name),

              /// O anki indexin yaşı
              subtitle: Text(student.age.toString()),

              /// Ve o anki indexin grade property'si true ise "Mezun" değilse "Mezun Değil" yazdırıyoruz.
              trailing: Text(student.grade ? "Mezun" : "Mezun Değil"),
            ),
          );
        },

        /// Burda itemCount değerine oluşturulacak liste eleman sayısını veriyoruz.
        itemCount: items.length,
      ),
    );
  }
}

/// * Bir model sınıfı oluşturduk ve bu modeli liste içinde kullanacağız.
class Student {
  final String name;
  final int age;
  final bool grade;
  const Student({
    required this.name,
    required this.age,
    required this.grade,
  });
}
