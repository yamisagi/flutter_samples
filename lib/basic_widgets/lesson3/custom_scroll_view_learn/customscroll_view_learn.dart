import 'package:flutter/material.dart';

/// * Biz kendimize göre özelleştirilmiş kaydırılabilir bir ekran yapmak istersek,
/// * Örneğin aynı ekranda hem liste hemde grid görmek istersek aradığımız widget CustomScrollView.
/// * Bu widget aynı zamanda ScrollView'den extend edilmiş olduğu için, ScrollView'ın özelliklerini taşır.

class CustomScrollViewLearn extends StatelessWidget {
  const CustomScrollViewLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String src =
        'https://img.freepik.com/premium-vector/hand-painted-background-violet-orange-colours_23-2148427578.jpg?w=2000';
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          /// Column ve Row gibi widgetleri CustomScrollView'ın içine yerleştirmek için children yerine slivers kullanılır.
          /// Fakat dökümantasyonda [https://api.flutter.dev/flutter/widgets/CustomScrollView-class.html] bahsedildiği gibi,
          /// [RenderSliver] türünde yapılar verilmelidir, [SliverAppBar], [SliverList], [SliverGrid] gibi.
          slivers: [
            /// AppBar - 1. Widget
            SliverAppBar(
              /// Bildiğimiz [AppBar] ile hemen hemen aynı parametrelere sahip bu appBar'ın,
              /// expandedHeight,collapsedHeight gibi standart [AppBard]'dan farklı özellikleri var.
              title: const Text('CustomScrollView Kullanımı'),

              /// Örneğin, expandedHeight değeri, appBar'ın ne kadar genişleyeceğini belirlemek için kullanıyoruz.
              expandedHeight: 300,
              backgroundColor: Colors.orange,

              /// floating: true ile appBar tamamen kaybolduktan sonra görünür olması için ilk elemanın ekrana gelmesini beklemez,
              /// ve kaydırılmaya başlandığı gibi appBar görünmeye başlar. Default değeri false'dir.
              floating: true,

              /// collapsedHeight değeri, appBar'ın yukarı doğru kaydırılırken flexibleSpace background'un kaybolmadan önce,
              /// ne kadar küçük olacağını belirlemek için kullanıyoruz.
              collapsedHeight: 150,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  src,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// Kaydırılabilir liste - 2. Widget
            /// SliverList ise tıpkı ListView gibi, kaydırılabilir bir liste oluşturmak için kullanılır.
            /// Fakat LisView'den farkı parametre olarak children yerine delagate adında [SliverChildDelegate] class'tan extend edilmiş bir widget alır.
            SliverList(
              delegate: SliverChildListDelegate(
                /// Burda dipnot [SliverChildListDelegate] ve türevlerini bir [SliverChildDelegate]'den extend edilmiş olduğu için kullanabildik,
                /// [SliverChildDelegate] bir abstract class'tır.
                /// Ve [SliverChildListDelegate]'e dikkatlice bakarsak children parametresi isimlendirilmemiş parametre olarak verilmiş.
                /// Bu yüzden elemanlarımızı direkt liste içinde ekledik.
                List.generate(
                  20,
                  (int index) => Card(
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: ListTile(
                      title: Text('Item $index'),
                    ),
                  ),
                ),
              ),
            ),

            /// Grid liste - 3. Widget
            /// SliverGrid ise tıpkı GridView gibi, kaydırılabilir bir grid liste oluşturmak için kullanılır.
            /// SliverList gibi delagate adında [SliverChildDelegate] class'tan extend edilmiş bir widget alır.
            /// Tek farkı gridDelagate adında bir parametre daha alır.
            /// Bu [SliverGridDelegateWithFixedCrossAxisCount] veya [SliverGridDelegateWithMaxCrossAxisExtent] alır.
            /// Adlarından da anlaşılacağı gibi biri tıpko diğer listelerdeki gibi verilen Count'a göre grid liste oluşturur.
            /// Diğeri ise verilen max değere kadar elemanı Extend edip grid liste oluşturur.
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                return Card(
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: ListTile(
                    title: Center(child: Text('SliverGrid $index')),
                  ),
                );
              }, childCount: 20),
            ),

            /// Tıpkı GridView'de gördüğümüz özellikler gibi bunda da aynı constructor'lar var.
            /// GridView.count() veya GridView.extent() gibi.
            SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 4,
              children: [
                for (int i = 0; i < 12; i++)
                  Container(
                    color: Colors.primaries[i],
                  ),
              ],
            ),

            /// Son olarak SliverList içerisinde SliverChildBuilderDelegate kullanarak,
            /// Tıpkı ListView.builder()'daki gibi kullanımını sağlayabiliriz.
            /// Son olarak aralarına bir padding eklemek için normalde [Padding] kullanırken,
            /// Sliver'lerde [SliverPadding] kullanırız.
            SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 20,
                  (context, index) {
                    return Card(
                      color: Colors.primaries[index % Colors.primaries.length],
                      child: ListTile(
                        title: Text('Item $index'),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
