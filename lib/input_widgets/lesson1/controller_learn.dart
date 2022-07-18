import 'package:flutter/material.dart';

/// [TextEditingController] ile [TextField]'ın değerini kontrol edebiliriz.
/// Aldığı değerleri tutmak ve kullanmak için her bir [TextField] için [TextEditingController] instance oluşturup gerekli kontroller yapılabilir.
class ControllerLearn extends StatefulWidget {
  const ControllerLearn({Key? key}) : super(key: key);

  @override
  State<ControllerLearn> createState() => _ControllerLearnState();
}

class _ControllerLearnState extends State<ControllerLearn> {
  /// Genellikle [TextEditingController] instance oluşturulurken,
  /// initState() methodu içerisinde Widget build edilirken bir defa oluşturulur ve kullanılır.
  /// Fakat burda dikkat edilmesi gereken şey initState() içinde instance oluşturulurken,
  /// dispose() ile Widget dispose edilirken [TextEditingController] için verilen memory'i sisteme geri kazandırmak önemli.

  late final TextEditingController _controller;

  /// Burda değinmemiz gereken başka bir şey de [FocusNode],
  /// [FocusNode] kullanımında ilgili [TextField] focus olduğunda davranışlarını kontrol edebileceğimiz bir yapıdır.
  /// Tıpkı [TextEditingController] gibi ayrı instance oluşturup kullanabiliriz.
  /// Ve aynı [TextField] gibi dispose etmeyi unutmamalıyız.
  late final FocusNode _focusNode;
  String _text = "";
  int maxLength = 10;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          /// [FocusNode] focus olduğunda,
          /// [TextField] için [TextEditingController] içerisindeki değerleri kontrol edebiliriz.
          /// Örneğin tanımladığımız maxLength değerini focus aldığında değiştirebiliriz.
          /// Bu durumda Focus aldığında maxLength 25, focus değiştiğinde 10 olarak değişecektir.
          maxLength = 25;
        } else {
          maxLength = 10;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controller Learn'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              focusNode: _focusNode,
              onChanged: (value) {
                setState(() {
                  _text = value;
                });
              },
              controller: _controller,
              maxLength: maxLength,
              decoration: const InputDecoration(
                labelText: 'AnyThing',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),

          /// Burda [TextEditingController] ile tuttuğumuz değeri ekrana yazdırmak için,
          /// Bir Text kullanıyoruz.
          Text(
            _text,
            style: const TextStyle(fontSize: 20),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'TextField',
                border: UnderlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              /// setState() methodu ile _controller.text ile tutulan değeri _text'e atıyoruz.
              setState(() {
                _text = "${_controller.text} from Button";
              });
            },
            child: const Text('Update Text'),
          ),
        ],
      ),
    );
  }
}
