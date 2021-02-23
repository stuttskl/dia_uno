import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './journal_entry.dart';

class AllEntiresList extends StatelessWidget {
  final list;

  AllEntiresList({Key key, @required this.list});


  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      shrinkWrap: true, 
      primary: false,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(list[index].title),
          subtitle: Text(DateFormat.yMMMMEEEEd().format(list[index].date)),
        );
      }
    );
  }
}
