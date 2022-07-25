import 'package:flutter/material.dart';
import 'package:flutter_samples/advanced_widgets/lesson1/bottomnavbar/dummy_pages/home_dummy.dart';
import 'package:flutter_samples/advanced_widgets/lesson1/bottomnavbar/dummy_pages/search_dummy.dart';

/// Bu kısımda ise oluşturduğumuz Dummy Page'lere
/// [BottomNavigationBar]'ının üzerine geçiş yapmasını sağlayacağız.
///
/// -----------------------------------------------------------------///
///  [HomePageDummy] ve [SearchPageDummy] sayfalarında o anki UI'ı tutmak için,
/// Yani o anki state'i tutmak için, [PageStorageKey] kullanımını da yaptık.
/// [HomePageDummy] içerisinde [ExpansionTile] kullanımını da yaptık.

class NavigationToPages extends StatefulWidget {
  const NavigationToPages({Key? key}) : super(key: key);

  @override
  State<NavigationToPages> createState() => _NavigationToPagesState();
}

class _NavigationToPagesState extends State<NavigationToPages> {
  /// İçerisine bizim ekranlarımızı alan bir liste ile,
  /// initState methodu ile daha ekran çizilmeden önce
  /// [_currentIndex] değişkeni üzerinden kontrol ediyoruz.

  List<Widget> _pages = [];

  /// - ***************************************************** -///
  /// İki farklı sayfamızın state'lerini tutmak için,
  /// [PageStorageKey] tanımlamasını Scaffold'umuzun olduğu sayfada yapıyoruz.
  /// Çünkü bu iki sayfayı burada tanımlamıştık
  final _homePageKey = const PageStorageKey('homePage');
  final _searchPageKey = const PageStorageKey('searchPage');
  @override
  void initState() {
    super.initState();
    HomePageDummy homePageDummy = HomePageDummy(
      key: _homePageKey,
    );
    SearchPageDummy searchPageDummy = SearchPageDummy(
      key: _searchPageKey,
    );
    _pages = [homePageDummy, searchPageDummy];
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavBar(),
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar Kullanımı'),
      ),
      body: _pages[_currentIndex],
    );
  }

  BottomNavigationBar bottomNavBar() {
    return BottomNavigationBar(
      /// Burda biz 2 tane sayfa oluşturduğumuz için
      /// length'ten dolayı bize hata vermesin diye
      /// ufak bir kontrol yaptık.
      onTap: ((value) => value <= _pages.length - 1
          ? setState(() => _currentIndex = value)
          : setState(() => _currentIndex = 0)),
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.red,
          activeIcon: Icon(Icons.person),
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
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          backgroundColor: Colors.yellow,
        ),
      ],
      type: BottomNavigationBarType.shifting,
    );
  }
}
