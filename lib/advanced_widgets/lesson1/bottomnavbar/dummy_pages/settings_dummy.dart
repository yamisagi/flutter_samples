import 'package:flutter/material.dart';

class SettingsPageDummy extends StatelessWidget {
  const SettingsPageDummy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemExtent: 200,
        itemBuilder: ((context, index) {
          return Card(
            borderOnForeground: true,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              trailing: const Icon(Icons.settings),
              title: Text('Settings $index'),
              subtitle: const Text('Settings Page'),
            ),
          );
        }));
  }
}
