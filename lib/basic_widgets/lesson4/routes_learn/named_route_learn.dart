import 'package:flutter/material.dart';

/// * [https://docs.flutter.dev/cookbook/navigation/named-routes]

/// * İsimlendirilmiş Route'lar bizim [MaterialApp] içerisinde, 'routes' parametresinde,
/// * Map şeklinde tanımladığımız ve bu Map'in key'lerine bir String, value'larına bir Widget'ının referansını verdiğimiz yapıdır.
/// * Bu şekilde uygulamamızda isimlendirilmiş Route'ları kullanabiliriz, bu şekilde uygulamamız çok sayfalı ve geniş çaplı bir uygulamaysa,
/// * Sayfalara daha düzenli şekilde erişebiliriz.
/// * Genellikle route'ların key'lerine ' / ' ile başlarız.
/// * Burda dikkat etmemiş gereken kısım, sadece ' / ' tanımlanan route bizim 'root' yani kök route'mizdir.
/// * Bunu tanımladığımızda ya MaterialApp içerisinde 'home' parametresini kullanmayız, ya da ' / ' ile başlayan route'u kullanmayız.
/// * İkisi aynı anda kullanılmaz.
/// * Diğer yandan uygulama içerisinde eğer bir şekilde yanlış yazarsak route'ların isimlerini örneğin,
/// * '/mypage' yerine yanlışlıkla '/page' yazarsak, gidilecek yerin null olduğunu gören uygulamamız bir fallback olarak,
/// * [onUnknownRoute] isimli methoda son çare olarak yönlendirir.
/// * Örnek route'ları [main.dart] içerisinde tanımladık.

class NamedRouteLearn extends StatelessWidget {
  const NamedRouteLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Named Route Kullanımı '),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Burdaki gibi [main.dart] içerisinde tanımladığımız isimlendirdiğimiz route'ları kullanabiliriz.
          Center(
            child: ElevatedButton(
              child: const Text('Push And Replacement'),
              onPressed: () {
                Navigator.pushNamed(context, '/push_and_replacement');
              },
            ),
          ),
          ElevatedButton(
            child: const Text('Custom Scroll View'),
            onPressed: () {
              Navigator.pushNamed(context, '/custom_scroll_view');
            },
          ),
        ],
      ),
    );
  }
}
