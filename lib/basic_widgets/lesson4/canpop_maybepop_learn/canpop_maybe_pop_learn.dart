import 'package:flutter/material.dart';

/// * MaybePop tıpkı pop() methodu ile aynı işi yapar. Fakat pop() methodu ile sayfa olsa da olmasa döner,
/// * Yani pop() eğer geride bir sayfa kalmamışsa ekranda siyah  bir  arkaplan görünür.
/// * CanPop() ise ondan farklı olarak geriye bir bool türünde veri dönderir.

class CanPopandMaybePopLearn extends StatelessWidget {
  const CanPopandMaybePopLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaybePop CanPop kullanımı'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Pop() methoduna basılırsa ekranda siyah arkaplan görünür.
          /// Çünkü pop() ile geride bir sayfa var veya yok farketmeden olan Page'i yığından atar.
          Center(
            child: ElevatedButton(
              child: const Text('Regular Pop'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),

          /// MaybePop() methoduna basılırsa ekranda eğer geri dönülecek bir sayfa varsa döner,
          /// Yoksa pop() gibi siyah ekran göstermez ve hiçbirşey yapmaz.
          Center(
            child: ElevatedButton(
              child: const Text('Maybe Pop'),
              onPressed: () {
                Navigator.of(context).maybePop();
              },
            ),
          ),

          /// CanPop() bize bir bool değer dönderir ve geride bir Page varsa true, yoksa false döner.
          /// Bunu kullanarak işlemler yapabiliriz.
          /// Örneğin;
          Center(
            child: ElevatedButton(
              child: const Text('Can Pop'),
              onPressed: () {
                /// Yani true dönerse ekranda 'Can Pop' yazısı görünür.
                Navigator.of(context).canPop()
                    ? canPop(context, 'Can Pop')

                    /// Eğer false dönerse ekranda 'Can Not Pop' yazısı görünür.
                    : canPop(context, 'Can Not Pop');
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Method

  Future canPop(BuildContext canPopContext, String text) {
    return showDialog(
        context: canPopContext,
        builder: (context) => AlertDialog(
              title: Center(child: Text(text)),
            ));
  }
}
