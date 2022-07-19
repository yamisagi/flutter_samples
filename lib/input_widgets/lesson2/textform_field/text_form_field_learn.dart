import 'package:flutter/material.dart';

/// [TextFormField] widget [TextField] ile nerdeyse aynı özellikleri var.
/// Fakat [TextFormField] widget bizim için [TextField]'den farklı özellikler sunar.
class TextFormFieldLearn extends StatefulWidget {
  const TextFormFieldLearn({Key? key}) : super(key: key);

  @override
  State<TextFormFieldLearn> createState() => _TextFormFieldLearnState();
}

class _TextFormFieldLearnState extends State<TextFormFieldLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Form Field Kullanımı'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          /// [Form] widget'ının içerisine [TextFormField] widget'inin
          /// validate parametresinin hangi durumlarda aktif olacağını belirleriz.
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                /// [decoration] parametresi, [TextField] widget'ı ile aynıdır.
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Input your name',
                ),

                /// [validator] parametresi, bizim için varolan değerleri kontrol edip,
                /// Kullanıcıya uyarı mesajı verebilmemizi sağlar.
                /// Örneğin burde kullanıcının girdiği isim 3 karakterden kısa ise,
                /// Kullanıcıya uyarı mesajı veririz.
                validator: (value) {
                  return value!.length < 3
                      ? 'Name must be longer than 3 chars'
                      : null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Surname',
                  hintText: 'Input your Surname',
                ),
                validator: (value) {
                  return value!.length < 3
                      ? 'Surname must be longer than 3 chars'
                      : null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Input your Email',
                ),
                validator: (value) {
                  return !(value!.contains('@'))
                      ? 'Email must contains @'
                      : null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Input your Password',
                ),
                validator: (value) {
                  return value!.length < 3
                      ? 'Password must be longer than 3 chars'
                      : null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
