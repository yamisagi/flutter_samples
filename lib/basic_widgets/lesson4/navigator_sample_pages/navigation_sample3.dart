import 'package:flutter/material.dart';

/// * Dummy Pages for Navigator Sample
class DemoPageThree extends StatelessWidget {
  const DemoPageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DemoPageThree'),
      ),
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          color: Colors.orange,
        ),
      ),
    );
  }
}
