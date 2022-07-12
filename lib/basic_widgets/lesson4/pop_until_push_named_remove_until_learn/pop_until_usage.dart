import 'package:flutter/material.dart';

/// *  popUntil ile bir şart verip o şartı sağlayan route'ların hepsini pop eder yani yığından siler.


class PopUntilLearn extends StatelessWidget {
  const PopUntilLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PopUntil'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('PopUntil'),
          onPressed: () {
            /// Örneğin burada route ilk sayfa olana kadar pop eder.
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
    );
  }
}
