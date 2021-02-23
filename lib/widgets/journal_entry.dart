import 'package:flutter/material.dart';

class JournalEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // title: Text(list[index].name),
      title: Text('Each Journal Entry Title')
      // subtitle: Text(list[index] is ShoppingList ? list.length.toString() + ' items' : list[index].address),
    );
  }
}