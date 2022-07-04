import 'package:flutter/material.dart';

class RowLearn extends StatelessWidget {
  const RowLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row ve Column Kullanımı'),
      ),
      body: Column(
        /// Row ve Column Flutter içerisinde en önemli iki yapıdır.
        /// Row: Birden çok Widget'i bir yatay olarak birleştirir.
        /// Column: Birden çok Widget'i bir dikey olarak birleştirir. 
        /// Column için main ile başlayan parametreler Y ekseni için geçerli.
        /// Row için main ile başlayan parametreler X ekseni için geçerli.

        /// * mainAxisAlignment bize içerisinde bulunan widgetlerin birbirine uzaklıklarını ayarlamak için kullanılır.
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        ///* crossAxisAlignment bize içerisinde bulunan widgetlerin Row için Y, Column için X ekseninde birbirine uzaklıklarını ayarlamak için kullanılır.
        // crossAxisAlignment: ,

        /// * mainAxisSize ise X [ Row() ] veya Y [ Column() ] ekseninde kaplayacağı alanı belli eder.
        /// * Default olarak [MainAxisSize.max] olarak gelir ve bütün alanı kaplayacaktır. 
        mainAxisSize: MainAxisSize.max,
        /// * Column ve Row birbirine eşit özellikleri taşır.
        /// * Tek farkları Column Y ekseninde yer alır.
        /// * Row X ekseninde yer alır.
        children: const [
          Icon(
            Icons.add_box_sharp,
            color: Colors.amber,
            size: 64,
          ),
          Icon(
            Icons.add_box_sharp,
            color: Colors.red,
            size: 64,
          ),
          Icon(
            Icons.add_box_sharp,
            color: Colors.black,
            size: 64,
          ),
          Icon(
            Icons.add_box_sharp,
            color: Colors.blue,
            size: 64,
          ),
          Icon(
            Icons.add_box_sharp,
            color: Colors.purple,
            size: 64,
          ),
          Icon(
            Icons.add_box_sharp,
            size: 64,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
