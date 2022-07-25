import 'package:flutter/material.dart';

/// [TabBar] widget daha önce gördüğümüz [BottomNavigationBar] ile neredeyse aynı işe yarayan bir widgettir.

class TabBarLearn extends StatefulWidget {
  const TabBarLearn({Key? key}) : super(key: key);

  @override
  State<TabBarLearn> createState() => _TabBarLearnState();
}

class _TabBarLearnState extends State<TabBarLearn>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();

    /// [TabController]'ın bir örneğini oluşturmak için [SingleTickerProviderStateMixin]'i with keyword ile kullanırız.
    /// [lenght] ile içine kaç eleman geleceğini belirtiriz.
    /// [vsync] ile animasyonun çalışmasını sağlar.
    /// [initialIndex] ile ilk açılan tab'ı belirtiriz. (Biz '1' olarak belirttiğimiz için hep ortadaki sayfa ile başlayacak.)
    _controller = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          /// [TabBar] [AppBar]'ın altında gösterileceği için [bottom],
          /// Parametresi içinde [TabBar] widget'ını kullanabiliriz.
          controller: _controller,

          /// [tabs] parametresi içinde [Tab] widget'larını alan bir liste ister.
          /// Ve dikkat edilmesi gereken bir konu ise,
          /// [Tab] widget'ının içinde aynı anda ya [text] ya da [child] parametresini kullanamayız.
          tabs: const [
            Tab(
              text: 'Tab 1',
            ),
            Tab(child: Icon(Icons.directions_bike)),
            Tab(text: 'Tab 3'),
          ],
        ),
        title: const Text('TabBar Kullanımı'),
      ),

      /// [body] parametresi içinde [TabBarView] widget'ını kullanabiliriz.
      /// [TabBar] ile aynı [controller] parametresini aldığı için ikisi de eşzamanlı olarak çalışır.
      body: TabBarView(
        controller: _controller,

        /// Burda [children] parametresi içinde [TabBarView] widget'ının içinde gösterilecek olan widgetlarının listesini kullanabiliriz.
        /// Ve dikkat edilmesi gereken kısım ise,
        /// [TabBar] içindeki [tabs] listesi ile aynı eleman sayısında olmalıdır.
        children: [
          Container(
            color: Colors.pink[300],
            child: const Center(
              child: Text(
                'Tab 1',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
          Container(
            color: Colors.red[300],
            child: const Center(
              child: Text(
                'Tab 2',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
          Container(
            color: Colors.purple[300],
            child: const Center(
              child: Text(
                'Tab 3',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
