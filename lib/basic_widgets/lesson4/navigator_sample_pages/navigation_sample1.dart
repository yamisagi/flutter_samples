import 'dart:math';

import 'package:flutter/material.dart';

/// * Dummy Pages for Navigator Sample
class DemoPageOne extends StatelessWidget {
  DemoPageOne({Key? key}) : super(key: key);
  final int _sayi = Random().nextInt(100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('DemoPageOne'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            dummyBox(),
            navigatorPopButton(context)
          ],
        ),
      ),
    );
  }

  SizedBox dummyBox() {
    return SizedBox(
            width: 200,
            height: 150,
            child: Card(
              color: Colors.cyan,
              child: Center(
                child: Text(
                  'Number is $_sayi',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
            ),
          );
  }

  ElevatedButton navigatorPopButton(BuildContext popContext) {
    return ElevatedButton(
      child: const Text('Pop'),
      onPressed: () {
        /// Burda geri döndermek istediğimiz değeri pop(değer) şeklinde veriyoruz ve
        /// push() ile push edilen sayfaya değer gönderiyoruz.
        /// Burda dikkat edilmesi gereken şey ilgili push()'a bu değeri bir 'Future<T>' tipinde gönderiyoruz.

        Navigator.of(popContext).pop(_sayi);
      },
    );
  }
}
