import 'package:flutter/material.dart';

/// * SingleChildScrollView widget'i adından da anlaşılacağı gibi, içerisinde tek bir child olan scroll edilebilir bir widgettir.
/// * Ekranımızda sadece bir adet yapı oluşturmak istiyorsak ve bu yapının scroll edilebilmesini istiyorsak SingleChildScrollView widget'ini kullanabiliriz.
/// ------------------------------------------------------------------------------------------
/// * .map() methodunu kullanmayı alışkanlık haline getirmek için örnekleri bununla yapacağım.

class SingleChildScrollViewLearn extends StatelessWidget {
  const SingleChildScrollViewLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'Joe',
      'Bob',
      'Mary',
      'Jane',
      'Jack',
      'Tom',
      'John',
      'Mary',
      'Jane',
      'Jack',
      'Tom',
      'John'
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildScrollView Kullanımı'),
      ),
      body: SingleChildScrollView(

          /// * Bizden bir child bekliyor ve widget türünde herhangi biri olabilir.
          /// * Bir liste ile çalışacağımız için bizden children, yani içerisinde widgetler olan bir liste bekleyen bir Widget olan Column ile çalışacağız.

          child: Column(
        /// * Bir map kullanıp liste içindeki elemanları tek dolaşıp biz bir Card widget'i oluşturup bu widget'leri Column'a ekliyoruz.
        children: items
            .map((String e) => Card(
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(e),
                    subtitle: Text(e),
                  ),
                ))
            .toList(),
      )),
    );
  }
}
