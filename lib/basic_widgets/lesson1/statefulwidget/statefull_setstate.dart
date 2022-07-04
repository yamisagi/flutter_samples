import 'package:flutter/material.dart';

/// * StatefulWidget, StatelessWidget'ten farklı olarak içerisinde mutable değişkenler kullanılabilir.
/// * Yani kendi State'lerinin değiştiğini anlayabilir ve buna göre setState() kullanarak güncelleme yapabilir.
/// * Bu yüzden internetten veri çekme vb. anlık değişiklikleri göstermek için StatefulWidget kullanılır.

class CounterStateLearn extends StatefulWidget {
  const CounterStateLearn({Key? key}) : super(key: key);

/// StatefulWidget' oluşturulurken iki adet sınıftan oluşur.
/// Biri abstract [StatelessWidget]'ten türetilirken createState() metodu override ederek üretilir,
/// İkinci olarak [State] sınıfından türetilerek işlemlerimizin yapılacağı yer olarak oluşturulur.
/// Burda en önemli faktör [BuildContext], [StatelessWidget] için sınıf oluşturulduğunda dışarıdan müdahele olmadığı sürece bir kez çalışır.
/// Ama [StatefulWidget] [setState()] methodu ile bunu manuel olarak tetikleyebilir.
/// IMPORTANT: Biz bu [StatefulWidget]'i bir [StatelessWidget] içerisinde çağırmamıza rağmen ekranı güncelleme işlememizi yapabildik.
  @override
  State<CounterStateLearn> createState() => _CounterStateLearnState();
}

class _CounterStateLearnState extends State<CounterStateLearn> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statefull Widget, State Kullanımı'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Butona tıklanma sayısı:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          /// * Görüldüğü üzere setState() methodu ile her butona tıklandığında sayımız artar.
          /// * Ve [BuildContext'i tetiklerek ekranın rebuild edilmesi sağlanır.
          debugPrint('setState() metodu tetiklendi.');
          _counter++;
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
