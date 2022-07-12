import 'package:flutter/material.dart';

/// * Yine popUntil ile aynı mantıkta fakat burda şarta göre isimlendirilmiş sayfayı o şartı sağlayan yere push eder.
class PushNamedRemoveUntilLearn extends StatelessWidget {
  const PushNamedRemoveUntilLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PushNamedRemoveUntil Kullanımı'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('PushNamedRemoveUntil'),
          onPressed: () {
            /// Örneğin burada route ilk sayfa olan yere ['/push_and_replacement'] sayfasını push eder.
            Navigator.pushNamedAndRemoveUntil(context, '/push_and_replacement', (route) => route.isFirst);
          },
        ),
      ),
    );
  }
}
