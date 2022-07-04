import 'package:flutter/material.dart';

class CardListTileLearn extends StatelessWidget {
  const CardListTileLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card ve ListTile Kullanımı'),
      ),
      body: Column(
        /// * Card widget yapı olarak biz Row vb yapılarını kullanmadan güzel bir UI yapısı sağlayan widgettir.
        /// * Bize default olarak elevation(yükseklik) vb. componentlerle birlikte gelir.
        /// * ListTile ise genellikle Card widget ile birlikte kullanılır ve,
        /// * leading,title,subtitle,trailing gibi componentleri içerir.
        /// * Tabi ki bu yapılar içersine Widget aldığı için istenilen şekilde kullanılabilir.
        /// * Fakat genellikle bu UI biçimi ile kullanılır.
        children: [
          Card(
            child: ListTile(

                /// * leading parametresi ile icon gösterilebilir.
                leading: const Icon(Icons.account_circle),

                /// * title parametresi ile başlık gösterilebilir.
                title: const Text('Card ListTile'),

                /// * subtitle parametresi ile alt başlık gösterilebilir.
                subtitle: const Text('Card ListTile'),

                /// * trailing parametresi ile buraya icon veya button vb. yapılar gösterilebilir.
                trailing: IconButton(
                  onPressed: () {
                    debugPrint('IconButton clicked');
                  },
                  icon: const Icon(Icons.keyboard_arrow_right),
                )),
          ),
        ],
      ),
    );
  }
}
