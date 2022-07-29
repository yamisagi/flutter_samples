import 'package:flutter/material.dart';
/// [LayoutBuilder] bize uygulamayı çalıştırdığımız cihazın boyutlarına göre kontrol sağlayabilmemizi sağlar,
/// Örneğin telefon ve tablet için farklı bir tasarım yapmak istediğimizde kullanabiliriz


class LayoutBuilderLearn extends StatelessWidget {
  const LayoutBuilderLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Builder Kullanımı'),
      ),
      body: LayoutBuilder(
        /// [LayoutBuilder] bizden [context] ve [constraints] parametrelerini alır,
        /// Ve [constraints] üzerinden kontrollerimizi sağlayabiliriz.
        builder: (context, constraints) {
          /// Örnek senaryo olarak, telefon ve tablet için farklı ekranlar yani widgetler,
          /// Tasarlamak istediğimizi düşünelim.
          /// Ve eğer cihazımız telefon ise, [constraints.maxWidth] değeri 600'den küçük ise,
          /// return edeceğimiz widget'ı, eğer değilse tablet için tasarladığımız widget'ı return ederek kullanabiliriz.
          if (constraints.maxWidth > 600) {
            /// Burda max width değeri 600'den büyük ise tablet için tasarladığımız widget'ı return ediyoruz.
            return const Center(
              child: Text('TABLET'),
            );
          } else {
            /// Değilse tabletten küçük bir cihaz olduğunu ve bunun telefon olarak varsayarak
            /// Telefon için tasarladığımız widget'ı return ediyoruz.
            return const Center(
              child: Text('TELEFON'),
            );
          }
        },
      ),
    );
  }
}
