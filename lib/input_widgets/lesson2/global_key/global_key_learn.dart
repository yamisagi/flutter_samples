import 'package:flutter/material.dart';

/// Global Key'ler sürekli build methodları tetiklenmesin, performans kaybı olmaması için Widgetlerimizi parçalara ayırırken,
/// Bu parçaların birbirleriyle ilişkili olmasını, o anki State'lerine erişebilmemizi sağlayan ID'ler gibi düşünebiliriz.
/// Aşağıdaki biri StatelessWidget, diğeri StatefulWidget olarak iki ayrı sınıf oluşturduk.
/// Normal şartlarda Stateless içerisinden Stateful içindeki State erişemezdik.
/// Fakat Global Key kullanarak Stateful içindeki State'leri erişebiliriz.

class GlobalKeyView extends StatelessWidget {
  GlobalKeyView({Key? key}) : super(key: key);

  /// Bir global key oluşturduk.
  /// ! Key'i tanımlarken, final GlobalKey globalkey = GlobalKey(); şeklinde yaparsak
  /// ! Oluşturduğumuz key'i GlobalKey<State<StatefulWidget>> olarak göreceği için,
  /// ! Key' kullanımında hata alırsınız istediğiniz State' elemanlarına erişemezsiniz.
  final globalKey = GlobalKey<_GlobalIncrementState>();

  @override
  Widget build(BuildContext context) {
    debugPrint('GlobalKeyView build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('GlobalKey Kullanımı'),
      ),
      body: Center(
        child: GlobalIncrement(
          /// Her stless veya stfl sınıf oluşturduğumuzda bize constructor'un otomatik olarak bir key parametresini oluşturmasının nedeni budur.
          key: globalKey,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          /// Burada globalKey'i kullanarak o anlık state'e erişip increment methodunu çağırdık.
          /// Bu Key'lerin kullanımında en önemli noktası,
          /// State'lerin birbirleriyle ilişkili fakat Sadece tek bir build methodu çalışıyor.
          /// Her şey baştan yazılmıyor.
          globalKey.currentState!.incrementCounter();
        }),
        child: const Icon(Icons.change_circle_rounded),
      ),
    );
  }
}

class GlobalIncrement extends StatefulWidget {
  const GlobalIncrement({Key? key}) : super(key: key);

  @override
  State<GlobalIncrement> createState() => _GlobalIncrementState();
}

class _GlobalIncrementState extends State<GlobalIncrement> {
  int _stateVariable = 0;

  void incrementCounter() {
    setState(() {
      _stateVariable++;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('GlobalIncrement build');
    return Text(
      _stateVariable.toString(),
      style: const TextStyle(fontSize: 50),
    );
  }
}
