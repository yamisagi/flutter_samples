import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Türleri'),
      ),
      body: Center(
          child: Column(
        children: [
          /// * Flutter'da Buttonlar için birçok hazır component var.
          /// * Ve bunlar oldukça özelleştirilebilir.
          /// * Buttonların içerisindeki style parametresi kullanılarak bunu yapabiliriz.
          /// * Temel Button Türleri
          TextButton(
            style: ButtonStyle(
              /// * Burda dikkat edilmesi gereken husus ise,
              /// * Kullanılan color vb. yapılar bildiğimiz Colors.red gibi tanımlanmayıp MaterialStateProperty olaral kullanıyoruz.

              /// * Aşağıdaki gibi bir şekilde kullanabiliriz.
              /// * Bu durumda .resolveWith() ile Buttonların olabileceği tüm durumlar için
              /// * Bir if-else kontrolü ile örneğin tıklandığında buttonun rengini değiştiriyoruz.
              /// * Ardından return null diyerek öteki tüm durumlarda default ne ise onu kullan diyebiliriz.
              
              /// * Farklı kullanımlarda her türlü durumlar için --> MaterialStateProperty.all(value) kullanılabilir.

              backgroundColor: MaterialStateProperty.resolveWith(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.black;
                  }
                  return null;
                },
              ),
            ),
            onPressed: () {},
            child: const Text('TextButton'),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('TextButton.icon'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('ElevatedButton'),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('ElevatedButton.icon'),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('OutlinedButton'),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('OutlinedButton.icon'),
          ),
        ],
      )),
    );
  }
}
