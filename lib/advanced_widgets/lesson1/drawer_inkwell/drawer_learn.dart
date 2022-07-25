import 'package:flutter/material.dart';

/// [Drawer] widget ekranın solundan kaydırılarak farklı bir menuye ulaşabildiğimiz bir yapıdır.
/// Genellikle [Drawer] bize log-in olmuş kullanıcının bilgilerini göstermek, uygulama ayarlarına girmek vs.
/// Bölümlerini koyduğumuz yapıdır.
class DrawerLearn extends StatelessWidget {
  const DrawerLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Kullanımı'),
      ),
      drawer: Drawer(
        /// [Drawer] widget'ı içerisine bir child alır,
        /// Biz birden çok widget kullanacağımız için [Column] kullandık.
        child: Column(
          children: [
            /// [UserAccountsDrawerHeader] özellikle [Drawer] içinde kullanabileceğimiz bir widgettir.
            /// İçine [currentAccountPicture] [accountName] ve [accountEmail] gibi parametreler alarak,
            /// işimizi oldukça kolaylaştırır.
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/84624853?s=96&v=4',
                ),
              ),
              accountName: const Text('Eren'),
              accountEmail: const Text('ecndn@xyz.com'),
              arrowColor: Colors.white,

              /// [onDetailsPressed] özelliği, kullanıcının detaylar sayfası gibi bir yapı kullanabileceğimiz,
              /// Bir [VoidCallback]'tir.
              onDetailsPressed: (() {}),
            ),

            /// Bu şekilde bir kullanımla [ListView] kullanarak içerisine scroll edilebilir liste ve eleman ekleyebiliriz.
            Expanded(
              child: ListView.separated(
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Text('Menu ${index + 1}'),
                      onTap: () {},
                    );
                  }),
                  separatorBuilder: ((context, index) {
                    return const Divider();
                  }),
                  itemCount: 5),
            ),

            /// Son olarak çok tercih edilmese de,
            /// AboutListTile widget'ı da ekranın en altında gösterilebilir bir widgettir.
            /// Bu widget, uygulama hakkında bilgileri göstermek için kullanılır.
            const AboutListTile(
              icon: Icon(Icons.info),
              applicationName: 'Drawer Kullanımı',
              applicationVersion: '1.0.0',
              applicationIcon: Icon(Icons.info),
              applicationLegalese: 'Copyright 2020',
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Drawer Kullanımı'),
      ),
    );
  }
}
