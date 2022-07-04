import 'package:flutter/material.dart';

/// Basitçe Scaffold widget'i kullanarak bir UI oluşturabiliriz.
/// Scaffold widget'i, app bar, drawer, floating action button, bottom navigation bar,
/// snackbar, bottom sheet, veya body'i içerir.
/// Yani Material Design adı altında bir çok component sunar.

class ScaffoldLearn extends StatelessWidget {
  const ScaffoldLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
