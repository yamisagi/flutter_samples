import 'package:flutter/material.dart';
import 'package:flutter_samples/advanced_widgets/lesson1/bottomnavbar/dummy_pages/home_dummy.dart';
import 'package:flutter_samples/advanced_widgets/lesson1/bottomnavbar/dummy_pages/search_dummy.dart';
import 'package:flutter_samples/advanced_widgets/lesson1/bottomnavbar/dummy_pages/settings_dummy.dart';

/// [PageView] kullanımında, liste olarak tuttuğumuz [Widget]'leri yatay veya dikey olarak,
/// Kaydırma efektiyle göstermek için kullanılır ve [ListView]'e oldukça çok benzer.
class PageViewLearn extends StatefulWidget {
  const PageViewLearn({Key? key}) : super(key: key);

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  /// ? Hem [BottomNavigationBar] hem de [PageView] indexini kontrol edebilmek için,
  /// ? Ortak bir değişken oluşturuyoruz .
  int _currentIndex = 0;

  /// ? [PageView]'ı kontrol edebilmek için bir controller oluşturuyoruz.
  late PageController _controller;

  /// ? [PageView]'ın içerisinde olan sayfaları bu index ile kontrol edebilmek için,
  /// ? Bir liste tanımladık, initState içinde gerekli atamaları yapacağız.
  List<Widget> _pages = [];
  @override
  void initState() {
    super.initState();
    _pages = const [
      HomePageDummy(
        key: PageStorageKey('home'),
      ),
      SearchPageDummy(
        key: PageStorageKey('search'),
      ),
      SettingsPageDummy()
    ];

    /// ? [PageController]'in [initialPage] değerine bizim kontrol edeceğimiz değişkeni atıyoruz.
    _controller = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView Kullanımı'),
      ),
      bottomNavigationBar: bottomNavBar(),
      body: PageView(
        /// [PageView]'i tanımladık ve kontrol edebilmek için yukarıda [PageController]'ı da tanımladık.
        controller: _controller,

        /// [onPageChanged] methodu ile, sayfa değiştiğinde,
        /// Bize değişen sayfa indexini alıp,
        /// kullanmamız için geri dönderiyor.
        onPageChanged: ((index) {
          /// ? [setState] methodu ile, sayfa değiştiğinde,
          /// ? [_currentIndex] değişkenini değiştiriyoruz ki,
          /// ? Hem [BottomNavigationBar] hemde [PageView]'ın indexini aynı tutmak için.
          setState(() {
            _currentIndex = index;
          });
        }),

        /// [children] listesinde, göstermek istediğimiz sayfaların listesini tanımladık.
        children: _pages,
      ),
    );
  }

  BottomNavigationBar bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        /// ? [PageController]'ın [jumpToPage] methodu ile,
        /// ? [index] değeri ile sayfa değiştiriyoruz.
        /// ? Bu sayede [index] değiştiğinde [_controller] değişen indexe sayfayı geçiyor.
        setState(() {
          _currentIndex = index;
          _controller.jumpToPage(index);
        });
      },
      type: BottomNavigationBarType.shifting,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
          backgroundColor: Colors.green,
        ),
      ],
    );
  }
}
