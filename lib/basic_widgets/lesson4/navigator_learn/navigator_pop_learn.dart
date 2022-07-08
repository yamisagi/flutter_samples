import 'package:flutter/material.dart';
import 'package:flutter_samples/basic_widgets/lesson4/navigator_sample_pages/navigation_sample1.dart';

/// * Navigator.of(context).pop() basitçe ile gittiğimiz sayfayı yığından atarak bir önceki sayfaya dönderir.
/// * Daha iyi görmek için [DemoPageOne] sayfasına bir method [navigatorPopButton] yazdık.
/// * Ve diğer bir özelliği ile .pop() bize bir değer dönderebilir.
/// * Yani gittiğimiz bir sayfadan değer alıp bir önceki sayfaya [Future] şeklinde değer taşıyabilir.

class NavigatorPopLearn extends StatefulWidget {
  const NavigatorPopLearn({Key? key}) : super(key: key);

  @override
  State<NavigatorPopLearn> createState() => _NavigatorPopLearnState();
}

class _NavigatorPopLearnState extends State<NavigatorPopLearn> {
  int? _geciciSayi = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Navigator Pop Kullanımı'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          sizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: const Text('Navigator Push'),
                onPressed: () async {
                  ///--------------------------------------------------------------------------------
                  /// Bu kısımda pop() methodundan dönderilen nesneyi bir Future olduğundan async await kullanarak döndürüyoruz.
                  /// Ve bunu geçici olarak bir yukarıda tanımladığımız değişkene atıyoruz.
                  /// ! Dikkat etmekte fayda var.
                  /// ! Gönderilen değeri Future ile .push() methodunu kullanarak bekliyoruz. *.pop() ile değil.
                  /// ! Ve biz bu Future işlemini sadece butonu tıklandığında yapıyoruz. Böyle ayarladık,
                  /// ! Yani eğer default olarak .push() methodundan gelen appbar'daki geri butonuna tıklarsak ekranda 'Null' değer görürüz.
                  /// ! Bunun da kontrolünü text içinde yapabiliriz.
                  /// ------------------------- NOTE ------------------------------------------------
                  /// Bu kısımda özellikle Type inference'e dikkat etmeliyiz.
                  /// 'await' ile döndürülen değerin Type'ının Future<int> yazarak bize bir 'int' değer geleceğini belirttik.
                  /// Ama biz kesinlikle bir değer geleceğini biliyoruz bu yüzden atadığımız sayıyı int? değil int olarak atayabilirdik,
                  /// Fakat Future nesnelerinde intenetten bilgi dönderebileceğimiz ve bu değerlerin null olabileceğini hesap ederek kullanmamız lazım.
                  /// --------------------------------------------------------------------------------
                  int? sayi = await Navigator.of(context).push<int>(
                    MaterialPageRoute(
                      builder: (context) => DemoPageOne(),
                    ),
                  );

                  /// ! BU KISIM ÖNEMLİ
                  /// _geciciSayi isimli değişkenimize, bir önceki sayfadan gelen await ile beklediğimiz 'sayi' değerini atıyoruz.
                  /// Ve bu değerin ekranda güncellenmesi için setState() methodunu ekranın tekrardan değişikliği göstermesi için
                  /// build() methodunun tetiklenmesi için kullanıyoruz.
                  setState(() {
                    _geciciSayi = sayi;
                  });
                  debugPrint(sayi.toString());
                },
              ),
              // navigatorPushButton(
              //   color: Colors.green,
              //   context,
              //   const DemoPageTwo(),
              // ) as Widget,
              // navigatorPushButton(
              //   color: Colors.orange,
              //   context,
              //   const DemoPageThree(),
              // ) as Widget,
            ],
          ),
        ]),
      ),
    );
  }

  SizedBox sizedBox() {
    return SizedBox(
      width: 200,
      height: 150,
      child: Card(
        color: Colors.red,
        child: Center(
          child: Text(
            /// AppBar'daki BackButtonu kullanınca Null geleceğinden bir null check yapıyoruz.
            _geciciSayi != null ? 'Number is $_geciciSayi' : 'Number is not defined.',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
