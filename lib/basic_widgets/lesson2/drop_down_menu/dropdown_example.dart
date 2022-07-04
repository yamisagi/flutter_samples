import 'package:flutter/material.dart';

class DropdownExample extends StatefulWidget {
  const DropdownExample({Key? key}) : super(key: key);

  @override
  State<DropdownExample> createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String? _dropdownValue;
  /// * Teker teker DropdownMenuItem ile uğraşmaktansa bir liste hazırlayıp,
  /// * .map() ile bize DropdownMenuItem'ler dönderen bir kullanım yapabiliriz.
  final List<String> _dropdownItems = ['1', '2', '3'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Kullanımı'),
      ),
      body: Center(
        child: DropdownButton(
          hint: const Text('Sayılar'),
          items: _dropdownItems.map((String e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              )).toList(),
          value: _dropdownValue,
          onChanged: (String? value) {
            setState(() {
              _dropdownValue = value;
            });
          },
        ),
      ),
    );
  }
}
