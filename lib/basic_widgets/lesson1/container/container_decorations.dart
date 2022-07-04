import 'package:flutter/material.dart';

class ContainerDecoration extends StatelessWidget {
  const ContainerDecoration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container Decorations'),
      ),
      body: Center(

          /// * Çoğu özelleştirme Container üzerinde decoration property'si kullanılarak verilebilir.

          child: Container(
        /// * Decoration bizden BoxDecoration türünde bir widget ister.

        decoration: BoxDecoration(
          /// * Önemli Not: decoration içerisinde bir color kullanıldıysa, Contaioner'in kendi color property'si kullanılmaz.

          color: Colors.black26,

          /// * Border property'si widget'in çerçevesini belirler. Ve Border'in isimlendirilmiş constructor'ını kullanır.

          border: Border.all(color: Colors.white12, width: 2),

          /// * BorderRadius property'si widget'in border'ının kenarlarının ne kadar kırpılacağını belirler.

          /// * Ve BorderRadius'in isimlendirilmiş constructor'ını kullanır.

          borderRadius: BorderRadius.circular(10),

          /// * Shape ise Container'in şeklini belirler.

          /// * Fakat eğer borderRadius kullanılmışsa shape'i kullanamayız.

          /// shape: BoxShape.circle,

          /// * BoxShadow property'si widget'in çerçevesini gölgelemeyi sağlar.
          /// * Ve bizden içerisinde BoxShadow türünde bir Widget'lerin bulunduğu bir liste ister.
          boxShadow: const [
            /// * BoxShadow'un parametrelerinde,

            BoxShadow(
              /// * spreadRadius bu rengin ve radius değerinin ne kadar saçılacağını belirler.

              spreadRadius: 0,

              color: Colors.black,

              /// * blurRadius bulanıklık değeri.

              blurRadius: 15,

              /// * Offset'in x ve y değerleri widget'in çerçevesinin nerede konumlandığını belirler.

              /// * Fakat Flutter'da normal matematikten farklı olarak,

              /// * Y ekseni yukarıdan (-) değerler ile başlar aşağı doğru (+) değer alır.

              offset: Offset(-5, 10),
            ),
          ],
          /// * Image ise child gibi değil Container'ın içerisine bir resim ekleyebilir.
          /// * Bizden bir image provider ister.
          // image: 
        ),

        /// Container'ın içeriğini göstermek için FlutterLogo kullandık.
        child: const FlutterLogo(
          size: 128,
        ),
      )),
    );
  }
}
