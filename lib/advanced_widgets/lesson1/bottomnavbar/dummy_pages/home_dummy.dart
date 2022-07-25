import 'package:flutter/material.dart';

class HomePageDummy extends StatelessWidget {
  const HomePageDummy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ((context, index) {
        return ExpansionTile(
          /// Burda bizim sayfamızın state'ini tutmak için,
          /// [PageStorageKey] kullanımını yaptık. Yapmasaydık bize dönen değer true - false olduğu için
          /// Bize hata verirdi. Bu yüzden  [ExpansionTile] state'ini tutmak için ayrı bir key tanımladık.
          /// Fakat tek bir farkla, eğer biz genel bir key tanımlasaydık,
          /// Örneğin [PageStorageKey('expansion')] gibi,
          /// Bu ListView'de sürekli bize aynı değer döndereceği için,
          /// Sadece bir [ExpansionTile] açık olsa bile hepsinin state'ini aynı görürüdü,
          /// Fakay biz her item oluşturlurken farklı [index]'ler aldığımız için,
          /// [PageStorageKey('$index')] kullanımını yaptık. Ki her [ExpansionTile]'in Value'si farklı olsun,
          /// Farklı itemlerde farklı stateler tutabilsin.
            key: PageStorageKey('$index'),
            title: Text('Home Page item $index'),
            children: [
              Card(
                child: ListTile(
                  leading: const Icon(Icons.library_add_check),
                  title: Text('Home Page item $index'),
                  subtitle: const Text('Home Page'),
                ),
              ),
            ]);
      }),
    );
  }
}
