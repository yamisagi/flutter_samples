import 'package:flutter/material.dart';

/// showDateTimePicker() fonksiyonu, ile ekranda bir tarih seçme kutusu gösterir.
/// Ve bu kutuyu kullanarak tarih seçmeyi yapabiliriz.

class DateTimePickerLearn extends StatelessWidget {
  const DateTimePickerLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// [showDateTimePicker] için gerekli [initialTime] parametresinde kullanılacak değişkeni tanımladık.
    TimeOfDay timeOfDay = const TimeOfDay(hour: 12, minute: 0);
    DateTime now = DateTime.now();

    /// Şu anki yılın bugünün en fazla 20 gün öncesini seçebilecek şekilde ayarladık.
    /// Bunu belirlerken [year, month, day] parametrelerine dikkat etmemiz gerekir.
    DateTime firstDate = DateTime(2022, now.month, now.day - 20);

    /// Şu anki yılın bugünün en fazla 20 gün sonrasını seçebilecek şekilde ayarladık.
    DateTime lastDate = DateTime(2022, now.month, now.day + 20);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Time Picker Kullanımı'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          ElevatedButton(
            onPressed: () async {
              /// [showDatePicker] fonksiyonu, ile ekranda bir tarih seçme kutusu gösterir.
              /// showDatePicker() fonksiyonu geriye [DateTime] dönderen ve [Future<DateTime>] şeklinde bir fonksiyondur.
              /// Bu yüzden async-await ya da .then() kullanarak bu fonksiyonu kullanabiliriz.
              DateTime? pickedTime = await showDatePicker(

                  /// İçerisine gönderilen [context] parametresi bu kutunun nerede gösterileceği bilgisini içerir,
                  context: context,

                  /// [initialDate] parametresi, tarih seçme kutusunda gösterilecek başlangıç tarihini belirtir.
                  initialDate: now,

                  /// [firstDate] parametresi, tarih seçme kutusunda gösterilecek en küçük tarihini belirtir.

                  firstDate: firstDate,

                  /// [lastDate] parametresi, tarih seçme kutusunda gösterilecek en büyük tarihini belirtir.

                  lastDate: lastDate);
              if (pickedTime != null) debugPrint('pickedTime: $pickedTime');
            },
            child: const Text('Pick a date'),
          ),
          ElevatedButton(
            onPressed: () async {
              /// [showTimePicker] ile ekranda bir saat seçme kutusu gösterir.
              /// Tıpkı [showDatePicker] ile aynı şekilde kullanılır.
              /// Ve bu fonksiyon geriye [TimeOfDay] döndürür. Future<TimeOfDay> şeklinde.
              final time = await showTimePicker(
                  context: context, initialTime: timeOfDay);
              if (time != null) debugPrint('pickedTime: $time');
            },
            child: const Text('Pick a time'),
          ),
        ],
      ),
    );
  }
}
