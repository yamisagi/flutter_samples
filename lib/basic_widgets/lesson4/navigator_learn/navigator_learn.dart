import 'package:flutter/material.dart';
import 'package:flutter_samples/basic_widgets/lesson4/navigator_sample_pages/navigation_sample1.dart';
import 'package:flutter_samples/basic_widgets/lesson4/navigator_sample_pages/navigation_sample2.dart';
import 'package:flutter_samples/basic_widgets/lesson4/navigator_sample_pages/navigation_sample3.dart';

/// * Navigator bizlere sayfa geçişleri yapmamızı sağlayan ve bunu çok farklı şekillerde yapabilmemizi sağlayan bir class.
/// * Navigator sınıfı, ilk olarak biz bir [MaterialApp] nesnesi oluştururken bize arka planda bir [Navigator] nesnesi oluşturur.
/// * [Navigator] nesnesini kullanırken daha önce gördüğümüz 'Widget Tree' içerisinde neyin nerde duracağı bilgisini,
/// * Bir üst yapıya taşıyan 'context' dediğimiz yapıyı kullanırız.
/// * Bu şekilde bir yığın yapısı olarak düşünebileceğimiz sayfalar arasında geçiş yapabiliriz.
/// * Kullanım şekli olarak [Navigator.of(context)] şeklinde ilgili context'e ulaşabiliriz.
/// * Bu sınıf, bizim sayfa geçişleri için kullanacağımız bir nesnedir.
/// * Daha önce oluşturduğumuz 3 dummy page ile [Navigator] sınıfını kullanarak sayfa geçişleri yaptığımız örnekler göreceğiz..

class NavigatorLearn extends StatelessWidget {
  const NavigatorLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator Kullanımı'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            navigatorPushButton(
              color: Colors.cyan,
              context,
              DemoPageOne(),
            ),
            navigatorPushButton(
              color: Colors.green,
              context,
              const DemoPageTwo(),
            ),
            navigatorPushButton(
              color: Colors.orange,
              context,
              const DemoPageThree(),
            ),
          ],
        ),
      ),
    );
  }

  /// Biraz daha az kalabalık olması adına bir metod oluşturduk.
  /// Bizden context ve bir route alıp, sayfa geçişi yapmak için kullanacağımız bir button oluşturduk.
  ElevatedButton navigatorPushButton(
    BuildContext buttonContext,
    Widget route, {
    Color color = Colors.blue,
  }) {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
      child: const Text('Navigator'),
      onPressed: () {
        /// Navigator.push() veya Navigator.of(context).push() metodları sayfa geçişi yapmak için kullanılır.
        /// push() metodu bir 'yığın' şeklinde sayfaları ardına ekler,
        /// Bu yüzde appBar'ımızda biz yapmasak bile bir geri dönüş butonu oluşturur. Oluşturmak için pop() metodunu kullanmış olur.
        /// Ve her sayfa geçişi yapılırken, 'yığının' bir sonraki elemanına geçeriz.
        /// Geri dönerken de bir önceki sayfayı gösterir. Yığın bittiğinde geri dönüş butonununda kaybolduğunu görebiliriz.
        /// İkisi de aynı işlev görür.
        /// Biz context yapısını daha iyi anlamak için [Navigator.of(context)] kullanıyoruz.
        Navigator.of(buttonContext).push(
          /// push() methodu bizden ,
          /// Parametre olarak 'context' alan ve 'route' "[Gitmek istediğimiz sayfa {Widget}]" return eden bir builder bekliyor.
          /// ? Burda biz genellikle Android kısmında çalıştığımız için [MaterialPageRoute] kullanıyoruz.
          /// ? Ama dilenirse IOS stili [CupertinoPageRoute]'da kullanabiliriz.
          /// ? Aynı işlev görür. Animasyonlar değişir.
          MaterialPageRoute(
            builder: (context) => route,
          ),
        );
      },
    );
  }
}
