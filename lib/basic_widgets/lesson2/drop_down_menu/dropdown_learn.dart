import 'package:flutter/material.dart';

class DropdownLearn extends StatefulWidget {
  const DropdownLearn({Key? key}) : super(key: key);

  @override
  State<DropdownLearn> createState() => _DropdownLearnState();
}

class _DropdownLearnState extends State<DropdownLearn> {
  String? _dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Kullanımı'),
      ),
      body: Center(
        child: DropdownButton(
          /// * Hint kullanarak ilk görünüşte gösterilecek olan texti ayarlayabiliriz.
          hint: const Text('Sayılar'),
          /// Diğer kullanım için --> [DropdownExample]
          items: const <DropdownMenuItem<String>>[
            /// *  DropdowButton kullanımında items parametresi ile bizden içerisinde,
            /// * [DropdownMenuItem] tipinde değerler isteyen bir liste bekler.

            /// ! Bu kullanım çoğunlukla önerilmez, hem uzun uğraş gerektirir.
            /// ! Hem de göze hoş gelmez.
            
            DropdownMenuItem<String>(
              /// * Value parametresi, dropdown menüde sakladığı değer.
              value: '1',
              /// * Child ise menüde gösterilen değer.
              child: Text('Bir'),
            ),
            DropdownMenuItem<String>(
              value: '2',
              child: Text('İki'),
            ),
            DropdownMenuItem<String>(
              value: '3',
              child: Text('Üç'),
            ),
          ],

          /// * value parametresini bir değişkende saklayıp,
          /// * dropdown menüde seçim yapıldığında, onChange ile bu değişkende değeri atama yapabiliriz.
          /// * Önemli olan kısım value parametresi, zorunlu değil halen arka planda value değişkeni olarak saklanır.
          /// * Fakat ekranda o anki değeri göstermek için kullanmalıyız.
          value: _dropdownValue,
          onChanged: (String? value) {
            /// * onChanged ile bir setState kullanarak değeri ekranda set edebiliriz.
            /// * Aksi halde değeri seçsekte ekranda görünmez.
            setState(() {
              _dropdownValue = value;

              /// Bu kısımda value (method'daki parametre olarak alınan değişken) onChange ile bir değişim yapıldığında
              /// _dropdownValue adlı null değişkenimize atamış olduk.
              // print(_dropdownValue);
              /// Print ile hangi değerin değiştiğini görebiliriz.
            });
          },
        ),
      ),
    );
  }
}
