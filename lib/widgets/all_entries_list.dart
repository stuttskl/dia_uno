import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/entry.dart';


class AllEntiresList extends StatelessWidget {
  final list;

  AllEntiresList({Key key, @required this.list});
  void goToFocusedEntry(context, destination, id) {
    print("Navigate to main entry page");
    if (destination == 'focusedEntry') {
      Navigator.pushNamed(
        context, 
        'focusedEntry',
        arguments: Entry(
          id: id,
          title: list[id].title,
          body: list[id].body,
          date: list[id].date,
          rating: list[id].rating
        ));
    }
    print(id);
  }

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
          onTap: () => goToFocusedEntry(context, 'focusedEntry', list[index].id),
        );
      }
    );
  }
}
