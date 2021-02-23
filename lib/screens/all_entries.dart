import 'package:flutter/material.dart';

import '../models/entry.dart';
import '../widgets/all_entries_list.dart';

class JournalEntries extends StatefulWidget {
  
  @override
  _JournalEntriesState createState() => _JournalEntriesState();
}

class _JournalEntriesState extends State<JournalEntries> {
  // pull this from db, mock data for now
  final List<Entry> entries = [
    Entry(id: 0, title: 'Entry 0', body: 'Some text', rating: 4, date: DateTime.now()),
    Entry(id: 1, title: 'Entry 1', body: 'Some text', rating: 4, date: DateTime.now()),
    Entry(id: 2, title: 'Entry 2', body: 'Some text', rating: 4, date: DateTime.now()),
    Entry(id: 3, title: 'Entry 3', body: 'Some text', rating: 4, date: DateTime.now()),
    Entry(id: 4, title: 'Entry 4', body: 'Some text', rating: 4, date: DateTime.now()),
    Entry(id: 5, title: 'Entry 5', body: 'Some text', rating: 4, date: DateTime.now()),
    Entry(id: 6, title: 'Entry 6', body: 'Some text', rating: 4, date: DateTime.now()),
    Entry(id: 7, title: 'Entry 7', body: 'Some text', rating: 4, date: DateTime.now()),
    Entry(id: 8, title: 'Entry 8', body: 'Some text', rating: 4, date: DateTime.now()),
    Entry(id: 9, title: 'Entry 9', body: 'Some text', rating: 4, date: DateTime.now()),
    Entry(id: 10, title: 'Entry 10', body: 'Some text', rating: 4, date: DateTime.now()),
    Entry(id: 11, title: 'Entry 11', body: 'Some text', rating: 4, date: DateTime.now()),
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
