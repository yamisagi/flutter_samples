import 'package:flutter/material.dart';

/// [TextField] widget'i kullanıcıdan bir input almak için kullanılır.
/// Ve kendi içerisinde bir çok özelleştirme yapabiliriz.

class TextFieldLearn extends StatelessWidget {
  const TextFieldLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField Learn'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              /// [onChanged] parametresi, TextField'ın içeriği değiştiği zaman tetiklenen bir callback fonksiyonudur.
              /// Ve bize son değerin değerini gönderir.
              /// Örneğin, bir kullanıcı bir metin girdiğinde, onChanged parametresi tetiklenir. Ve buna göre işlemler yapılabilir.
              /// Aşağıdaki gibi eğer dönen metnin uzunluğu 5'ten büyük ise value yazılır,
              /// değilse value boş kalır gibi.
              onChanged: (value) => value.length > 5 ? debugPrint(value) : null,

              /// [onSubmitted] parametresi, kullanıcının inputu gönderdiğinde bize bir String dönderen bir yapıdır.
              onSubmitted: (value) => debugPrint(value),

              /// [keyboardType] parametresi, kullanıcının gireceği inputa göre keyboard tipini belirlememizi sağlar.
              /// Örneğin kullanıcıdan sadece number istemişsek [TextInputType.number] şeklinde kullandığımızda
              /// Açılan keyboard tipi numaraların olduğu bir keyboard tipidir.
              keyboardType: TextInputType.number,

              /// [autofocus] parametresi, Bu sayfaya ilk girildiğinde TextField'in direkt açılmasını belirler.
              autofocus: true,

              /// [maxLength] parametresi, kullanıcının girdiği inputun en fazla kaç karakter olacağını belirler.
              maxLength: 25,

              /// [decoration] parametresi, textfield'ın özelliklerini belirten bir yapıdır.
              decoration: const InputDecoration(
                /// [labelText] parametresi, textfield'ın üstündeki label'ını belirten bir yapıdır.
                labelText: 'TextField',

                /// [hintText] parametresi, textfield'ın altındaki hint'i yani ipucu metnini belirten yapıdır.
                hintText: 'Input Numbers',
                // Border ise textfield'ın çerçevesini belirten yapıdır.
                /// Üç farklı çerçeve vardır.
                /// [UnderlineInputBorder] --> [OutlineInputBorder] --> [InputBorder.none]
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'TextField',
                // hintText: 'TextField',
                border: UnderlineInputBorder(),

                /// PrefixIcon ve SuffixIcon parametreleri, textfield'ın başındaki ve sonundaki iconlarını belirten yapıdır.
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
