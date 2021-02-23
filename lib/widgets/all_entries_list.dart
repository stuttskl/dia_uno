import 'package:flutter/material.dart';

class AllEntiresList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // gives it a size
      primary: false, // so it doesn't scroll
      // itemCount: list.length,
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          // title: Text(list[index].name),
          title: Text('Each Journal Entry Title')
          // subtitle: Text(list[index] is ShoppingList ? list.length.toString() + ' items' : list[index].address),
        );
      }
    );
  }
}