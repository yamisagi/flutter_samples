import 'package:flutter/material.dart';

class PopupMenuLearn extends StatefulWidget {
  const PopupMenuLearn({Key? key}) : super(key: key);

  @override
  State<PopupMenuLearn> createState() => _PopupMenuLearnState();
}

class _PopupMenuLearnState extends State<PopupMenuLearn> {
  /// * PopupMenuButton'da tıpkı DropdownMenu gibi bir widgettir ve çoğu özelliği benzer.
  /// * Fakat DropdownMenu'de biz item adında bir parametre beklerken PopupMenuButton bizden bir builder bekliyor.
  /// * Bu içerisine bir context alarak aslında ileride,
  /// * Navigation işlemleri yaparken çok neyin nerede durması gerektiğini belirtir.
  /// --------------------------------------------------------------------------------
  /// * Tıpkı DropdownMenu'de olduğu gibi bir liste tanımladık uzun yoldan yapmamak için,
  /// * İçerisinde String bulunan bir liste oluştuduk,
  
  String? _selectedMenuItem;
  final List<String> _items = ['One', 'Two', 'Three', 'Four', 'Five'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PopupMenu'),

        /// * Genellikler appBar'ın üstünde bulunan actions parametresi içerisinde verilir.
        
        actions: [
          /// Dikkat edilmesi gereken husus default olarak <dynamic> tipi Flutter tarafından veriliyor,
          /// Fakat biz bu şekilde bırakmayıp veri tipi olarak ne dönderiyorsak onu vermemiz hem performans hem de okunabilirlik açısından önemlidir.
          PopupMenuButton<String>(
            /// * Default olarak 3 nokta şeklinde bir iconla gelir fakat,
            /// * child parametresi kullanılarak istediğimiz şekilde özelleştirebiliriz.
            /// * Örneğin aşağıdaki gibi bir [_selectedMenuItem] değişkenini o kısımda gösterebiliriz.
            // child: Center(
            //   child: Text(
            //     _selectedMenuItem ?? 'Select a menu item',
            //     style: Theme.of(context).textTheme.headline6,
            //   ),
            // ),
            onSelected: (String value) {
              /// 
              setState(() {
                _selectedMenuItem = value;
                debugPrint(_selectedMenuItem);
              });
            },
            /// Burda yine [DropdownExample] içinde olduğu gibi .map() methodundan faydalanarak,
            /// Bize içerisinde PopupMenuItem'ler dönderen bir liste oluşmasını sağladık.
            itemBuilder: (BuildContext context) => _items
                .map(
                  (String e) => PopupMenuItem(                    
                    value: e,
                    child: Text(e),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
