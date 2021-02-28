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
  Journal journal; // a journal model stores a list of entires of type Entry
  List<Entry> entries;

  @override
  void initState() {
    super.initState();
    loadJournal();
  }

  //  void goToFocusedEntry(context, destination, id) {
  //   if (destination == 'focusedEntry') {
  //     // extracting object data to pass as args
  //     // to the focusedEntry route
  //     Navigator.pushNamed(context, 'focusedEntry',
  //       arguments: Entry(
  //         id: list[id].id,
  //         title: list[id].title,
  //         body: list[id].body,
  //         date: list[id].date,
  //         rating: list[id].rating));
  //   }
  // }

  void loadJournal() async {
    final Database database = await openDatabase('journal.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, body TEXT NOT NULL, rating INTEGER NOT NULL, date TEXT NOT NULL');
    });

    // get all journal entries from database
    List<Map> journalRecords =
        await database.rawQuery('SELECT * from journal_entries');
    print("journal records:");
    print(journalRecords);

    List<Entry> journalEntries = journalRecords.map((record) {
      return Entry(
          id: record['id'],
          title: record['title'],
          body: record['body'],
          rating: record['rating'],
          date: record['date']);
    }).toList();

    print("journal entries:");
    print(journalEntries);

    setState(() {
      journal = Journal(entries: journalEntries);
    });
  }


  Widget build(BuildContext context) {
    if (journal == null) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator()],
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
                AllEntiresList(list: journal.entries),
              ],
            ),
          );
        }));
    }
    
  }
}
