import 'package:flutter/material.dart';

import '../widgets/journal_entry.dart';
import '../widgets/all_entries_list.dart';

class JournalEntries extends StatefulWidget {
  @override
  _JournalEntriesState createState() => _JournalEntriesState();
}

class _JournalEntriesState extends State<JournalEntries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('All Entires')),
        body: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // MainScreenListHeader(text: headerShoppingLists),
                AllEntiresList(),
                // MainScreenListHeader(text: headerStores),
                // MainScreenList(list: stores),
              ],
            ),
          );
        }
      )
    );
  }
}
