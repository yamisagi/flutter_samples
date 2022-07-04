import 'package:flutter/material.dart';

/// Container ve Center ile ilgili örnekler.
/// Container yapı olarak özelleştirilebilen bir widget.
/// Container'ın içinde bir widget yerleştirilebilir.
///

class ContainerLearn extends StatelessWidget {
  const ContainerLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Container and Center"),
        centerTitle: true,
      ),

      /// Container içerisine width ve height değerleri verilmemişse,
      /// İçerisine parent widgetin tüm alanına yayılır,
      /// Veya içerisinde child var ise önce childin alanına yayılır,
      /// Bu kısımda body kısmına Container verdiğimizde Scaffold tüm ekranı kapladığı için
      /// Container'ın içindeki widgetlerin ekranın tamamını kaplar.
      body: Center(
        /// Center widget ise adı üstüne içerisindeki child'i ortalamakla görevlidir.
        /// Ve bunun tricky pointi ise widthFactor ve heightFactor değerleri verilmemişse içinde bulunduğu tüm alana yayılır ve ona göre ortalar.
        /// widthFactor ve heightFactor değerleri verilmişse, onların çarpımına göre ortalama yapar.

        /// widthFactor: 1.5,
        /// heightFactor: 1.5,
        /// Gibi.
        child: Container(
          constraints: const BoxConstraints(
            /// Bu kısımda Container'ın minimum ve maksimum boyutlarını belirtiyoruz.
            minWidth: 200,
            minHeight: 200,
            maxWidth: 300,
            maxHeight: 300,
          ),

          /// Burda Tricky point olarak bir allignment kullandığımızda parentine göre davranış sergiliyor,
          /// Bu nedenle minimum ve maksimum değerleri sayıyor,
          /// Ama bir alignment kullanmazsak, tamamen childinin özelliklerini kullanır.
          /// { Kendi width ve height'i ezilir ve childin özellikleri [width: 150 , height: 150 ] kullanılır. }
          /// Ama constraints yapısını ezemez.
          alignment: Alignment.center,
          color: Colors.blue,
          child: Container(
            alignment: Alignment.center,
            width: 150,
            height: 150,
            color: Colors.red,
            child: const Text("EREN"),
          ),
        ),
      ),
    );
  }
}
