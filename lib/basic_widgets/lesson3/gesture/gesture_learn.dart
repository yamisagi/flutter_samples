import 'package:flutter/material.dart';

/// * GestureDetector basitçe anlatmak gerekirse içindeki child'e ekranla etkileşime girebileceği,
/// * Dokunma,sürükleme vb. özellikleri sağlar.

class GestureLearn extends StatelessWidget {
  const GestureLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gesture Kullanımı'),
      ),
      body: Center(
          child: GestureDetector(
        /// GestureDetector ile bir Card sarmalayıp,
        /// parametrelerdeki etkileşimler için void callback şeklinde istedimizi yaptırmayı sağlayabiliriz.
        /// Örneğin, çift tıklama için onDoubleTap:
        onDoubleTap: () => debugPrint('Double Tap'),

        /// Tek tıklama için onTap:
        onTap: () => debugPrint('Tap'),

        /// Uzun basılı tutma için onLongPress:
        onLongPress: () => debugPrint('Long Press'),

        /// Sürükleme esnasındaki hareketleri yakalamak için onHorizontalDragUpdate, onVerticalDragUpdate..
        /// vb. parametreleri kullanabiliriz.
        onHorizontalDragUpdate: (DragUpdateDetails details) =>
            debugPrint('Horizontal Drag Update $details'),
        onHorizontalDragStart: (DragStartDetails details) =>
            debugPrint('Horizontal Drag Start @$details'),
        onHorizontalDragEnd: (DragEndDetails details) =>
            debugPrint('Horizontal Drag End @$details'),
        child: Card(
          child: ListTile(
            title: const Text('Gesture Element'),
            subtitle: const Text('Gesture Element'),
            leading: IconButton(
              /// Burda dikkat edilmesi gereken bir durum ise Flutter her ne kadar bir GestureDetector
              /// Kullansakta içerisinde bulunan child'in onTap özelliği varsa ona öncelik verir.
              /// Bu durumda bizim IconButtonumuza tıklasakta debugPrint'te 'Tap' yazısı çıkmıyor.
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ),
        ),
      )),
    );
  }
}
