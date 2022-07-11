import 'package:flutter/material.dart';
import 'package:flutter_samples/basic_widgets/lesson4/navigator_sample_pages/navigation_sample1.dart';

/// * pushReplacement() tıpkı push mantığı ile aynıdır. Fakat pushReplacement() ile gidilen sayfanın önceki sayfasını kapatır.
/// * Yani adından da anlaşılacağı üzere push ettiği sayfayı kendi sayfası ile değiştirir ve yığından atar.

class PushAndReplacementLearn extends StatelessWidget {
  const PushAndReplacementLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PushReplacement Kullanımı'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              /// Burda pushReplacement() ile gidilen sayfada farkedileceği üzere push() ile gidildiğinde geri butonu oluştururdu fakat bunda oluşmaz.
              /// Bu işlev ile örneğin,
              /// Bir Log-In sayfasına gidildiğinde eğer başarılı bir şekilde giriş yapıldıysa,
              /// Tekrardan geri dönülmesi hoş bir deneyim olmayacağı için push() yerine pushReplacement() kullanılabilir.
              child: const Text('PushReplacement Button'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DemoPageOne(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
