import 'package:flutter/material.dart';

import '../widgets/journal_entry.dart';
import '../models/entry.dart';
import '../widgets/all_entries_list.dart';

class JournalEntries extends StatefulWidget {
  
  @override
  _JournalEntriesState createState() => _JournalEntriesState();
}

class _JournalEntriesState extends State<JournalEntries> {
  final List<Entry> entries = [
    Entry(id: 0, title: 'Entry 0', body: 'Some text', rating: 4, date: DateTime.now()),
    Entry(id: 1, title: 'Entry 1', body: 'Some text', rating: 4, date: DateTime.now()),
    Entry(id: 2, title: 'Entry 2', body: 'Some text', rating: 4, date: DateTime.now()),
    Entry(id: 3, title: 'Entry 3', body: 'Some text', rating: 4, date: DateTime.now()),
    Entry(id: 4, title: 'Entry 4', body: 'Some text', rating: 4, date: DateTime.now()),
    Entry(id: 5, title: 'Entry 5', body: 'Some text', rating: 4, date: DateTime.now()),
    Entry(id: 0, title: 'Entry 0', body: 'Some text', rating: 4, date: DateTime.now()),
    Entry(id: 1, title: 'Entry 1', body: 'Some text', rating: 4, date: DateTime.now()),
    Entry(id: 2, title: 'Entry 2', body: 'Some text', rating: 4, date: DateTime.now()),
    Entry(id: 3, title: 'Entry 3', body: 'Some text', rating: 4, date: DateTime.now()),
    Entry(id: 4, title: 'Entry 4', body: 'Some text', rating: 4, date: DateTime.now()),
    Entry(id: 5, title: 'Entry 5', body: 'Some text', rating: 4, date: DateTime.now()),
  ];

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
                AllEntiresList(list: entries),
              ],
            ),
          );
        }
      )
    );
  }
}
