import 'package:flutter/material.dart';

/// * Dummy Pages for Navigator Sample
class DemoPageTwo extends StatelessWidget {
  const DemoPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DemoPageTwo'),
      ),
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          color: Colors.green,
        ),
      ),
    );
  }
}
