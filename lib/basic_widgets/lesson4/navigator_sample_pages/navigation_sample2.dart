import 'package:flutter/material.dart';
import 'package:flutter_samples/basic_widgets/lesson4/navigator_learn/navigator_willpopscope_learn.dart';

/// * Dummy Pages for Navigator Sample
class DemoPageTwo extends StatelessWidget {
  const DemoPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        debugPrint('onWillPop() çalıştı.');

        /// * [onWillPop] methodu çalıştığında, eğer içine 'false' değerini verirsek, sayfa geri tuşu ve appBar butonu ile geri dönmeyecek.
        // return false;
        /// * Burda bir popup penceresi oluşturup, kullanıcıya bir feedback veriyoruz.
        /// * Eğer kullanıcı popup penceresi içerisinde 'Yes' butonuna basarsa, 'true' değerini döndürüyoruz ve tekrardan WillPopSopeLearn() sayfasına push ediyoruz.
        /// * Eğer kullanıcı popup penceresi içerisinde 'No' butonuna basarsa, 'false' değerini döndürüyoruz ve ekrandan çıkamamış olarak kalıyor.
        /// * Geri tuşuna basıldığında her zaman showDialog() içindeki değerlerden birini seçmek zorunda olduğu için true ya da false döndermesi önemli değil.
        dialogButton(context);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('DemoPageTwo'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                child: Text(
                  'This is the only way out.',
                ),
              ),
              ElevatedButton(
                child: const Text('Go back to WillPopScopeLearn'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future dialogButton(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Are you sure?'),
              actions: [
                TextButton(
                  child: const Text('Yes'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const WillPopSopeLearn()));
                  },
                ),
                TextButton(
                  child: const Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ],
            ));
  }
}
