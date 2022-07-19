import 'package:flutter/material.dart';

/// Slider ise bir aralıkta bir değer seçmek için kullanılır.
/// Örneğin ses seviyesini ayarlayabiliriz.
/// Veya Yaşı seçebiliriz.

class SliderLearn extends StatefulWidget {
  const SliderLearn({Key? key}) : super(key: key);

  @override
  State<SliderLearn> createState() => _SliderLearnState();
}

class _SliderLearnState extends State<SliderLearn> {
  double _value = 50.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Kullanımı'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Volume is \n${_value.round()}',
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.center,
          ),
          Slider(
            /// Bu kısımda [value] parametresine başlangıçta bir değer atamak için kullanıyoruz,
            value: _value,
            /// [min] ve [max] değer aralığını belirliyoruz,
            min: 0,
            max: 100,
            /// [divisions] ise [max] değer üzerinde kaç adet bölümün oluşacağını belirleriz,
            /// Örneğin [max] değeri 100 olan bir slider'ın, 5'er bölümlü olması için 20 değeri verdik.
            /// Yani 100'ü 20'ye böldük. 
            divisions: 20,
            /// [label] ise slider'ın üzerinde gösterilecek başlıktır. 
            label: '${_value.round()}',
            /// onChanged ise slider'ın değeri değiştiğinde çalışacak fonksiyon.
            /// Biz burda setState kullanarak slider'ın değeri değiştiğinde
            /// Değişen değeri [newValue] ilk değerimize atıyoruz.
            onChanged: (newValue) {
              setState(() {
                _value = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
