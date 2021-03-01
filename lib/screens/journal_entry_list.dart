import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../models/entry.dart';
import '../models/journal.dart';
import '../widgets/all_entries_list.dart';

class JournalEntries extends StatefulWidget {
  static const routeName = 'allEntries';

  @override
  _JournalEntriesState createState() => _JournalEntriesState();
}

class _JournalEntriesState extends State<JournalEntries> {
  Journal journal;
  List<Entry> entries;
  String createQuery;

  @override
  void initState() {
    super.initState();
    loadJournal();
  }

  goToNew(context, destination) {
    if (destination == 'newJournalEntry') {
      Navigator.pushNamed(context, 'newJournalEntry');
    }
  }

  void loadJournal() async {
    final Database database = await openDatabase('journal.sqlite3.db',
        version: 1, onCreate: (Database db, int version) async {
      await db.execute(createQuery);
    });

    // get all journal entries from database
    List<Map> journalRecords =
        await database.rawQuery('SELECT * from journal_entries');

    List<Entry> journalEntries = journalRecords.map((record) {
      return Entry(
        id: record['id'],
        title: record['title'],
        body: record['body'],
        rating: record['rating'],
        dateTime: DateTime.parse(record['dateTime'])
      );
    }).toList();

    setState(() {
      journal = Journal(entries: journalEntries);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (journal == null) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Loading...')],
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: Text('All Entires')),
        body: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              AllEntriesList(list: journal.entries),
            ],
          ));
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () => goToNew(context, 'newJournalEntry'),
          tooltip: 'New Journal Entry',
          child: const Icon(Icons.add),
          backgroundColor: Colors.teal,
          focusColor: Colors.tealAccent,
        ),
      );
    }
  }
}
