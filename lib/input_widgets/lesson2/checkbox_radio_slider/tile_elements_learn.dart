import 'package:flutter/material.dart';

/// Bu kısımda TileElements yani [CheckBox] - [Radio] - [Slider] kullanımlarını göreceğiz.
/// Başlamadan bu üç eleman '[ListTile]' olarak geliştirilmiş versiyonlarını kullanacağız,
/// Ki zaten aynı kullanıma sahipler, sadece title vb. daha fazla özellik sunar.
/// Bu üç eleman da bize seçimlerimize göre işlemleri yönetmemizi sağlar.

class TileElements extends StatefulWidget {
  const TileElements({Key? key}) : super(key: key);

  @override
  State<TileElements> createState() => TileElementsState();
}

class TileElementsState extends State<TileElements> {
  bool _isChecked = false;
  String selectedCity = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tile Element Kullanımı'),
      ),
      body: ListView(
        children: [
          CheckboxListTile(
            /// Burda başlangıçta false olarak tanımladık,
            /// Ve [onChanged] parametresi ile true-false olarak değiştirebilmemiz için,
            /// callback fonksiyonu tanımladık.
            /// Ve _isChecked değişkenine dönen değeri atadık.
            value: _isChecked,
            onChanged: (check) {
              setState(() {
                _isChecked = check ?? false;
              });
            },

            /// Başlık parametresi,
            title: const Text('Checkbox'),

            /// Subtitle parametresi,
            subtitle: const Text('Subtitle'),

            /// Tıpkı leading parametresi gibi kullanılır,
            secondary: const Icon(Icons.check),
          ),

          /// * RadioListTile'da ise işlem biraz farklıdır,
          /// Öncelikler bize seçilen elemanın ne değer döndermesini istediğimizi belirtmemiz daha iyi bir kullanımdır,
          /// Bu nedenle RadioListTile<T> şeklinde tanımladık.
          /// [groupValue] parametresi ile, birden çok RadioListTile'ın aynı grup içinde olmasını sağlayabiliriz.
          /// Yani aynı grupta bir değer seçildiğinde o değeri kullanabiliriz.
          /// [onChanged] parametresi ile, seçilen değeri döndürmek için callback fonksiyonu tanımlayıp,
          /// [value] parametresi ile seçilen değeri groupValue için tanımladığımız ortak değişkene atayabiliriz.
          /// title ile arasındaki farkı anlamak için seçilen değere selected ibaresi eklendi.
          /// ? Özetlemek gerekirse kullanım senaryosuna göre,
          /// ? Kaç adet RadioListTile'ın birbiri ile bağlantılı hepsine aynı groupValue değeri atanır,
          /// ? [value] parametresi ile o değeri kullanarak, [onChanged] callback fonksiyonu ile değiştirebiliriz, kontrol edebiliriz.
          radioTile(
            groupValue: selectedCity,
            value: 'Kayseri Selected',
            title: 'Kayseri',
          ),
          radioTile(
            groupValue: selectedCity,
            value: 'İstanbul Selected',
            title: 'İstanbul',
          ),
          radioTile(
            groupValue: selectedCity,
            value: 'Ankara Selected',
            title: 'Ankara',
          ),

          /// Tıpkı CheckboxListTile'daki kullanım gibi kullanılır,
          SwitchListTile(
            value: _isChecked,
            onChanged: (check) {
              setState(() {
                _isChecked = check;
              });
            },
            title: const Text('Switch'),
          ),
        ],
      ),
    );
  }

  RadioListTile<String> radioTile({
    required String groupValue,
    required String value,
    required String title,
  }) {
    return RadioListTile<String>(
      groupValue: groupValue,
      value: value,
      onChanged: (select) {
        setState(() {
          selectedCity = select ?? "";
          debugPrint(selectedCity);
        });
      },
      title: Text(title),
      subtitle: const Text('Subtitle'),
      secondary: const Icon(Icons.location_city),
    );
  }
}
