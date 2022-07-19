import 'package:flutter/material.dart';

/// Bu kısımda [TextFormField] widget'ının içinde alınan değerleri kaydetmeyi ve [GlabalKey] kullanımı ile erişmeyi sağlayacağız.
/// Aşağıda detaylıca bahsedelim,

class TextFormFieldSaveDataLearn extends StatefulWidget {
  const TextFormFieldSaveDataLearn({Key? key}) : super(key: key);

  @override
  State<TextFormFieldSaveDataLearn> createState() =>
      _TextFormFieldSaveDataLearnState();
}

class _TextFormFieldSaveDataLearnState
    extends State<TextFormFieldSaveDataLearn> {
  /// [GlobalKey] isimli bir instance oluşturduk. Ve bunu State ile haberleşmek için kullanacağız.
  /// [GlobalKey] ile ilgili daha detaylı bahsedeceğiz.

  final _formKey = GlobalKey<FormState>();

  /// Daha sonra [TextFormField] içine gelen değerleri tutmak için 4 adet değişken oluşturduk.

  String? _name, _surname, _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Form Field Kullanımı'),
      ),

      /// [TextFormFieldLearn] ile aynı şekilde [TextFormField] ekledik.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              /// Daha kolay olmas için bir method oluşturduk.
              textFormFieldModel(
                isEmail: false,
                type: 'Name',
              ),
              textFormFieldModel(
                isEmail: false,
                type: 'Surname',
              ),
              textFormFieldModel(
                isEmail: true,
                type: 'Email',
              ),
              textFormFieldModel(
                isEmail: false,
                type: 'Password',
              ),
              ElevatedButton(
                onPressed: () {
                  /// Bu kısımda [Form] widgetimizle haberleşmek için verdiğimiz [GlobalKey]'i kullanarak,
                  /// [_formKey.validate()] methodunu çağırdık. Bu [TextFormField] widget'imize tanımladığımız validate parametresindeki değerleri kontrol ederek,
                  /// Eğer değerler doğru (valid) ise aşağıda yazacağımız kodları çalıştıracaktır.
                  /// Eğer değilse else bloğu çalışacaktır.
                  String result =
                      'Name: $_name\nSurname: $_surname\nEmail: $_email\nPassword: $_password';
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(result),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Form hatalı'),
                      ),
                    );
                  }

                  /// Daha [setState] methodunu çağırıp,
                  /// Geçerli State'te yukarıda tanımladığımız değişkenleri resetlemek için kullandığımız (.reset())) methodu çağırıp,
                  /// Ve [_name, _surname, _email, _password] değişkenlerini null olarak atayarak sıfırladık.
                  setState(() {});
                  _formKey.currentState?.reset();
                  _email = _password = _name = _surname = null;
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField textFormFieldModel({
    required bool isEmail,
    required String type,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: type,
        hintText: 'Input your $type',
      ),

      /// [validator] parametresi, bizim için varolan değerleri kontrol edip doğru bilgileri aldığımızı,
      /// [GlobalKey] kullanarak yukarıda oluşturduğumuz button ile kontrol edeceğiz.

      /// [onSaved] parametresi ile bunu değişkenlerimize türüne göre atıyoruz.
      onSaved: (newValue) {
        switch (type) {
          case 'Name':
            _name = newValue;
            break;
          case 'Surname':
            _surname = newValue;
            break;
          case 'Email':
            _email = newValue;
            break;
          case 'Password':
            _password = newValue;
            break;
        }
      },

      /// Bu kısımda daha önce bahsettiğimiz validasyon kısmını yapıyoruz.
      validator: (value) {
        if (isEmail) {
          return !(value!.contains('@')) ? 'Email must contains @' : null;
        } else {
          return value!.length < 3 ? '$type must be longer than 3 chars' : null;
        }
      },
    );
  }
}
