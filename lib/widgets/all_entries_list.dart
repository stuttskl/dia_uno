import 'package:flutter/material.dart';
import '../models/entry.dart';

class AllEntiresList extends StatelessWidget {
  final List<Entry> list;

  AllEntiresList({Key key, @required this.list});

  void goToFocusedEntry(context, destination, id) { 
    print("inside of focusedEntry, id is: " + id.toString());
    if (destination == 'focusedEntry') {
      // extracting object data to pass as args
      // to the focusedEntry route
      Navigator.pushNamed(context, 'focusedEntry',
          arguments: Entry(
              id: id,
              title: list[id].title,
              body: list[id].body,
              date: list[id].date,
              rating: list[id].rating));
    }
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
            subtitle: Text(list[index].date),
            onTap: () =>
                goToFocusedEntry(context, 'focusedEntry', list[index].id -1), // this needs to be -1...
          );
        });
  }
}
