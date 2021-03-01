import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/entry.dart';

class AllEntriesList extends StatelessWidget {
  final List<Entry> list;

  AllEntriesList({Key key, @required this.list});

  void goToFocusedEntry(context, destination, id) {
    if (destination == 'focusedEntry') {
      Navigator.pushNamed(context, 'focusedEntry',
        arguments: Entry(
          id: id,
          title: list[id].title,
          body: list[id].body,
          dateTime: list[id].dateTime,
          rating: list[id].rating
        )
      );
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
          title: 
            RichText(
                text: TextSpan(
                  text: list[index].title,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
          subtitle: Text(DateFormat('yMMMMEEEEd')
              .format(DateTime.parse(list[index].dateTime.toString()))),
          onTap: () => goToFocusedEntry(context, 'focusedEntry',
            list[index].id - 1)
        );
      }
    );
  }
}