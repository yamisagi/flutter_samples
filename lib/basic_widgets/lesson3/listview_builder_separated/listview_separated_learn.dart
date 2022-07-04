import 'package:flutter/material.dart';

/// * ListView.separated() tıpkı ListView.builder() gibi aynı özelliklere sahiptir.
/// * Tek farkı separatorBuilder ile liste elemanlarının arasında ,
/// * Belki bir uygulama yapıyorsak bir reklam, boşluk vb. yapılar kullanabiliriz.

class ListViewSeparatedLearn extends StatelessWidget {
  const ListViewSeparatedLearn({Key? key}) : super(key: key);

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
        title: const Text('ListView Separated Kullanımı'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          /// Önce çirkin bir görüntü olmaması için item listemizin o anki indexisini bir değişkende tutuyoruz.
          Student student = items[index];
          return Card(
            /// Bu şekilde bir kullanım ile efektif bir şekilde ListView.separated() kullanımı yapılabilir.
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
        /// itemCount oluşturulmasını istediğimiz kadar bize item oluşturur.
        /// Yani illa 5000 itemli bir listemiz var diye 5000 adet item oluşturmak zorunda değiliz.
        itemCount: items.length,
        separatorBuilder: (context, index) {
          /// Örneğin her 5 elemandan birinde bir boşluk ekleyerek liste elemanlarının arasında reklam gösterilebilir.
          /// Burda ++index gibi bir yapı kullanmamızın nedeni,
          /// index bildiğimiz üzere 0'dan başladığı için ++ ile önce değerini 1 artırıp sonra modunu almak istiyoruz ki doğru bir şekilde
          /// Reklam konumlansın.
          if (++index % 5 == 0) {
            return Card(
              color: Colors.blue.shade100,
              child: const ListTile(
                leading: Icon(Icons.star),
                title: Text('Reklam'),
              ),
            );
          }

          return Container();
        },
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
