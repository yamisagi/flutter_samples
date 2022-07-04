import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';

/// * IntrinsicHeight , FadeInImage , PlaceHolder;
/// * IntrinsicHeight : Bu Widget içerisindeki en yüksek widgete göre yükseklik belirler.
class FadeInPlaceHolderLearn extends StatelessWidget {
  const FadeInPlaceHolderLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FadeInPlaceHolder'),
      ),
      body: IntrinsicHeight(
        child: Row(
          /// * IntrinsicHeight widgeti kullanarak buradaki en yüksek widgete göre yükseklik belirleyebiliriz.
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// * Görüldüğü gibi ilk Container'in yüksekliği 200 diğerleri 100 olmasına rağmen,
            /// * Diğer Container'lerin yüksekliği 200 olacaktır.
            Container(
              height: 200,
              width: 100,
              color: Colors.red,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.green,
            ),
            Flexible(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.yellow,
              ),
            ),
            /// * FadeInImage widgeti kullanarak resim yüklenirken bir placholder görüntüsü gösterir
            /// * Ve image yüklenirken görüntüler arasında geçiş yapar.
            // FadeInImage.memoryNetwork(
            //     placeholder: kTransparentImage,
            //     image:
            //         'https://carwow-uk-wp-3.imgix.net/Volvo-XC40-white-scaled.jpg'),
          ],
        ),
      ),
    );
  }
}
