import 'package:flutter/material.dart';

/// * showDialog() bize ekranla etkileşime girdiğimizde, ekranda gösterilmesini istediğimize göre kullanıcıya uyarı vermek için kullanılır.
/// * Çoğunluk AlertDialog ile birlikte kullanılır MaterialDesign kurallarını takip ettiğimiz için.

class AlertShowDialogLearn extends StatelessWidget {
  const AlertShowDialogLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Person> items = List.generate(100, (index) {
      return Person(
        name: index % 2 == 0 ? 'Ali' : 'Ayşe',
        age: index > 50 ? index ~/ 10 : index,
        alive: index > 75 ? true : false,
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShowDialog ve AlertDialog Kullanımı'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          Person person = items[index];
          return Card(
            color: person.alive ? Colors.green.shade100 : Colors.red.shade100,
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(person.name),
              subtitle: Text(person.age.toString()),
              trailing: Text(person.alive ? "Yaşıyor" : "Yaşamıyor"),
            ),
          );
        },
        separatorBuilder: (seperatorContext, index) {
          if (++index % 2 == 0) {
            return Card(
              color: Colors.blue.shade100,
              child: ListTile(
                leading: IconButton(
                  onPressed: () {
                    /// Genel yapıya bakarsak showDialog() bizden bir context: bir de builder: bekliyor.
                    /// builder, ekranda gösterilecek olan widget'i oluşturur.
                    /// context, ise bir üst widgetten gelen context'i bilgisini kullanarak kendini nereye konumlandırması gerektiğini bilir.
                    showDialog(

                        /// Görüldüğü gibi context separatorBuilder'ının context'ini olarak kullanır.
                        context: seperatorContext,

                        /// Burda ise biz bir context verip, olur da return ettiğimiz yapının contexte ihtiyacı varsa,
                        /// O da 'myContext' adlı yapıyı kullansın.
                        /// ! Bu yüzden context'lerin adlarının önemi yoktur. Ondan dolayı genellikle her zaman 'context' adını kullanırız ki,
                        /// ! Karışıklık olmasın.
                        builder: (showDialogContext) {
                          return AlertDialog(
                            /// AlertDialog yapısı da bu şekilde bir title,content ve actions şeklinde material tasarıma uygun şekildedir.
                            title: Text(items[index].name),
                            content: const Text('Do you want dissmis AD?'),
                            actions: [
                              TextButton(
                                child: const Text('Tamam'),
                                onPressed: () {
                                  /// Burda dikkat edilirse builder'ın bizden neden bir context vermemizi istediğini anlayabiliriz.
                                  /// Navigator.of(context).pop() ekranda bir 'Ekran' olarak tabir edilen bir nesne var onu kapatır,
                                  /// Ve bir önceki 'context'e geri döndürür.
                                  /// Bundan dolayı bizden bir context bekler, ve biz de tabi bir üst context'imiz olan 'showDialogContext''i veriririz.
                                  /// Ve 'Tamam' a basınca ekranımız bir önceki halini almış olur.
                                  /// Tam olarak mantık bu şekilde.
                                  Navigator.of(showDialogContext).pop();
                                },
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Hayır',
                                  ))
                            ],
                          );
                        });
                  },
                  icon: const Icon(Icons.star),
                ),
                title: const Text('Reklam'),
              ),
            );
          }

          return Container();
        },
        itemCount: 100,
      ),
    );
  }
}

/// Örneklerde kullanmak için bir model sınıfı oluşturduk.
class Person {
  final String name;
  final int age;
  final bool alive;
  const Person({
    required this.name,
    required this.age,
    required this.alive,
  });
}
