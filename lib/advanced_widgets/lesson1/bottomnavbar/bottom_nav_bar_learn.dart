import 'package:flutter/material.dart';

/// [BottomNavigationBar] bizim ekranımızda alt kısmında sayfalar arası geçiş vb. işlemler için kullandığımız bir widget'tir.

class BottomNavBarLearn extends StatefulWidget {
  const BottomNavBarLearn({Key? key}) : super(key: key);

  @override
  State<BottomNavBarLearn> createState() => _BottomNavBarLearnState();
}

class _BottomNavBarLearnState extends State<BottomNavBarLearn> {
  /// Bir index değeri olarak [_selectedIndex] değişkeni tanımladık.
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        /// onTap fonksiyonu, [BottomNavigationBar]'ın bir tıklanmasını dinleyen fonksiyontur ve
        /// [currentIndex] değişkeni ile [_currentIndex] değişkenini birbirine setState kullanarak eşitliyoruz ki,
        /// tıkladığımız index değeri [_currentIndex] değişkenine atandığında ekran tekrardan build edilsin.
        onTap: ((value) => setState(
              () {
                _currentIndex = value;
              },
            )),
        currentIndex: _currentIndex,

        /// [items] parametresine [BottomNavigationBarItem] türünden bir liste olarak verilir.
        items: const [
          BottomNavigationBarItem(
            /// [BottonNavigationBarItem]'bizden [label] - [icon] - değerlerini zorunlu alır,
            /// Her ne kadar [label] zorunlu olarak istenmiyor görünse de vermezsek hata verir.
            icon: Icon(Icons.home),
            label: 'Home',

            /// [backgroundColor] parametresi, [BottomNavigationBar]'ın o anki arka planını belirler.
            /// Bu [backgroundColor] [BottomNavigationBar]'ın [type]' eğer,
            /// [BottomNavigationBarType.shifting] ise, [BottomNavigationBar]'ın arka planını değiştirir.
            /// [BottomNavigationBar]'ın [type]' eğer, [BottomNavigationBarType.fixed] ise,
            /// En yakındaki [ThemeData] içindeki [canvasColor] ne ise o değeri default olarak alır.
            backgroundColor: Colors.red,

            /// [activeIcon] ile o aktif olan itemin [icon] değerini değiştirir.
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

        /// [type] parametresi, [BottomNavigationBar]'ın türünü belirler.
        /// ! Ve eğer default olarak [items]'ın içindeki itemler 4 veya daha fazla ise,
        /// ! Default olarak [BottomNavigationBarType.shifting] olarak ayarlanır.
        /// Ve biz eğer 4'ten düşük itemlerimiz için,
        /// dinamik olarak [backgroundColor] değerleri vermek istiyorsak,
        /// Yani her farklı bir item için farklı bir arka plan rengi kullanmak istiyorsak,
        /// [BottomNavigationBarType.shifting] olarak ayarlamalıyız.
        type: BottomNavigationBarType.shifting,

        /// [fixedColor] parametresi, o anki aktif [icon]'un rengini belirler.
      ),
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar Kullanımı'),
      ),
      body: const Center(
        child: Text('Bottom Navigation Bar Kullanımı'),
      ),
    );
  }
}
