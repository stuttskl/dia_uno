import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../models/entry.dart';
import '../models/journal.dart';
import '../widgets/all_entries_list.dart';

class JournalEntries extends StatefulWidget {
  @override
  _JournalEntriesState createState() => _JournalEntriesState();
}

class _JournalEntriesState extends State<JournalEntries> {
  // Journal journal;
  AllEntiresList journal;
  // pull this from db, mock data for now
  // final List<Entry> entries = [
  //   Entry(
  //       id: 0,
  //       title: 'Entry 0',
  //       body: 'Some text',
  //       rating: 4,
  //       date: DateTime.now()),
  //   Entry(
  //       id: 1,
  //       title: 'Entry 1',
  //       body: 'Some text',
  //       rating: 4,
  //       date: DateTime.now()),
  //   Entry(
  //       id: 2,
  //       title: 'Entry 2',
  //       body: 'Some text',
  //       rating: 4,
  //       date: DateTime.now())
  // ];

  @override
  void initState() {
    super.initState();
    loadJournal();
  }

  void loadJournal() async {
    // var database = openDatabase('journal.db');
    final Database database = await openDatabase('journal.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, body TEXT NOT NULL, rating INTEGER NOT NULL, date TEXT NOT NULL');
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
          date: record['date']);
    }).toList();

    print(journalEntries[0].title);
    setState(() {
      // journal = Journal(entries: journalEntries);
      // AllEntriesList(list: journalEntries);
    });
  }

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
                // AllEntiresList(list: journalEn),
              ],
            ),
          );
        }));
  }
}
