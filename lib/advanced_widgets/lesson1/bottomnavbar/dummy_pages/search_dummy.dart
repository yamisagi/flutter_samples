import 'package:flutter/material.dart';

class SearchPageDummy extends StatelessWidget {
  const SearchPageDummy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemExtent: 200,
        itemBuilder: ((context, index) {
          return Card(
            color: index % 2 == 0 ? Colors.amber : Colors.blue,
            borderOnForeground: true,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.library_add_check),
              title: Text('Search Page item $index'),
              subtitle: const Text('Search Page'),
            ),
          );
        }));
  }
}
