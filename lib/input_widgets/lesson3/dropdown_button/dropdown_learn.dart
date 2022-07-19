import 'package:flutter/material.dart';

/// DropdownButton bize bir liste yapısı sunup seçimler yapabilmemizi sağlayan yapıdır.

class DropDownLearn extends StatefulWidget {
  const DropDownLearn({Key? key}) : super(key: key);

  @override
  State<DropDownLearn> createState() => _DropDownLearnState();
}

class _DropDownLearnState extends State<DropDownLearn> {
  /// [value] parametresi için değerleri tutan değişken.
  String? _value;

  /// [items] parametresi için içerisinde [DropdownMenuItem]'lar bulunan listemiz.
  final List<DropdownMenuItem<String>> _items = const [
    DropdownMenuItem(
      // Burda dikkat edilmesi gereken bir nokta,
      // [value] parametresi için değerleri tutan değişkenin değerini,
      value: "Ankara Selected",
      // [child] parametresi ise ekranda görünen değeri belirtir,
      child: Text('Ankara'),
    ),
    DropdownMenuItem(value: "İstanbul Selected", child: Text('İstanbul')),
    DropdownMenuItem(value: "İzmir Selected", child: Text('İzmir')),
    DropdownMenuItem(value: "Bursa Selected", child: Text('Bursa')),
    DropdownMenuItem(value: "Van Selected", child: Text('Van')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DropDown Kullanımı'),
      ),
      body: Center(
        /// Öncelikle DropdownButton'un geriye döndereceği değerin türünü belirtmeliyiz.
        child: DropdownButton<String>(

            /// DropdownButton'un menü arkaplan rengini belirtiyoruz.
            dropdownColor: Colors.red[100],

            /// Buttonun tam altında çizgi olarak görünmesini istediğimiz parametre.
            underline: Container(
              height: 2,
              color: Colors.red,
            ),

            /// hint ise eğer [value] parametresi boş ise gösterilecek metin.
            hint: const Text('Seçiniz'),
            borderRadius: const BorderRadius.all(Radius.circular(10)),

            /// [value] parametresi bizim değerimizi tutan ve aynı zamanda intial value değeridir.
            /// Yukarıda tanımladığımız [_value] değişkeni ilk başta null olduğu için hint'imiz görünüyor.
            value: _value,

            /// Items parametresi ise bizden içerisinde [DropdownMenuItem] nesneleri isteyen bir liste ister,

            items: _items,

            /// [onChanged] parametresi ise seçim yapıldığında tetiklenecek olan fonksiyon.
            onChanged: (value) {
              setState(() {
                /// Burda setState fonksiyonu ile state'imize seçilen değeri [value],
                /// Bizim null olan[_value] değişkenine atıyoruz.
                /// Ve [_value] değişkeni artık seçilen değere eşit olduğu için,
                /// hint'imiz görünmez ve yerine seçilen değer görünür.
                /// Örneğin "Ankara" seçildiyse _value değeri "Ankara Selected" olup ,
                /// Ekranda [DropdownMenuItem] child kısmına "Ankara" yazdığımız için o şekilde görünür.
                /// Daha detaylı şekilde yukarıda anlatıldı.
                _value = value;
              });
            }),
      ),
    );
  }
}
