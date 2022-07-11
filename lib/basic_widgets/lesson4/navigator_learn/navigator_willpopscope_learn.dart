import 'package:flutter/material.dart';
import 'package:flutter_samples/basic_widgets/lesson4/navigator_sample_pages/navigation_sample1.dart';
import 'package:flutter_samples/basic_widgets/lesson4/navigator_sample_pages/navigation_sample2.dart';

/// * WillPopScope widget, [Navigator.pop()] içersinde gördüğümüz, butona bastığımızda sayfada oluşan sayıyı diğer değerini alıp dönderirken,
/// * Buton dışında geri tuşu veya appBar'daki geri butonuna basıldığında 'Null' değer döndermesini engellemek için kullanılır.
/// * Kullanıcının geri tuşuna basıldığında, [WillPopScope] widget'ının içerisindeki [onWillPop] methodu çalışır ve
/// * [Future] nesnesi döndürür. Bu şekilde kullanıcıya bir feedback verebiliriz. Ve 'Null' değeri kontrol edebiliriz.
/// * ---------------------------------------------------------------------------------------------------------------------
/// * [WillPopScope] widget'ının çalışması için push() methodu ile gittimiz sayfalarda, WillPopScope widget'ının parametrelerine,
/// * child olarak Geri gelmek istenilen Widget'i veriyoruz. Ki genellikle Scaffold'dur.
/// * onWillPop , ile de geri dönülmek istendiğinde çalışan ve Future nesnesi dönderen kontorol edeceğimiz yapı çalışır.
/// ? Daha iyi kavramak için [DemoPageTwo] sayfasına push eden bir buton ve [DemoPageTwo] sayfası içerisinde,
/// ? [WillPopScope] widget'ının kullanımı var. 
class WillPopSopeLearn extends StatelessWidget {
  const WillPopSopeLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WillPopScope Kullanımı'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Go to Dummy Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DemoPageTwo(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
