import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Webview ile web sayfalarını uygulamamızda gösterebiliriz.
/// Bunun için öncelikle pubspec.yaml dosyamıza [webview_flutter] paketini eklememiz gerekiyor.
/// Ve cihaz IOS ise [ios/Runner/Info.plist] dosyasına aşağıdaki kodu eklememiz gerekiyor.
/// -----------
/// <key>io.flutter.embedded_views_preview</key>
/// <true/>
/// -----------
/// Cihaz Android ise [WebView] ile uyumlu çalışabilmesi için
/// Minimum SDK Version 19 olmalıdır.
/// -- DAHA FAZLA BİLGİ İÇİN --
/// [https://pub.dev/packages/webview_flutter]

class WebViewLearn extends StatelessWidget {
  const WebViewLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web View Kullanımı'),
      ),

      /// Uygulamanın body kısmına [WebView] ekliyoruz.
      body: const WebView(
        /// [initialUrl] parametresi ile başlangıçta hangi sayfayı göstereceğimizi belirliyoruz.
        initialUrl: 'https://www.google.com',

        /// [javascriptMode] parametresi ile javascript'i aktif ediyoruz.
        /// Bu sayede web sayfamızda javascript ile yazılmış kodları çalıştırabiliriz.
        javascriptMode: JavascriptMode.unrestricted,

        /// [allowsInlineMediaPlayback] parametresi ile web sayfamızda video oynatma izni veriyoruz.
        /// Bu değer androidde zaten izin verildiği için bu parametreyi vermesekte olur.
        /// Fakat IOS için bu parametreyi vermemiz gerekiyor.
        allowsInlineMediaPlayback: true,
      ),
    );
  }
}
