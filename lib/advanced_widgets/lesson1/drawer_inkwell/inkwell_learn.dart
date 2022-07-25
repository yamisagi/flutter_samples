import 'package:flutter/material.dart';

/// [InkWell] widget içerisie gelen child'i
/// Tıpkı bir button gibi responsive olmasını sağlar.
/// Tüm özellikleri için : https://api.flutter.dev/flutter/material/InkWell-class.html

class InkwellLearn extends StatelessWidget {
  const InkwellLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inwell Kullanımı'),
      ),
      body: Center(
        child: InkWell(
          /// İçerisinde birden çok özelleitirilebilir durumlar var.
          /// [onTap] - [onDoubleTap] vb. durumlara göre ele alabileceğimiz çoklu durumları kullanabiliriz.
          onTap: (() {
            showInkwell(context, 'Tek Tıklandı');
          }),
          onDoubleTap: () {
            showInkwell(context, 'Çift Tıklandı');
          },
          onLongPress: () {
            showInkwell(context, 'Uzun Tıklandı');
          },
          child: const Text('Touch Me!'),
        ),
      ),
    );
  }

  Future<dynamic> showInkwell(BuildContext context, String type) {
    return showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text('Inkwell'),
          content: Text('Inkwell $type'),
          actions: [
            ElevatedButton(
              child: const Text('Tamam'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      }),
    );
  }
}
