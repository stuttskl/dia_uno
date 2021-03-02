import 'package:dia_uno/main.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';

import '../models/entry.dart';
import '../models/journal.dart';
import '../widgets/journal_scaffold.dart';

class JournalEntries extends StatefulWidget {
  static const routeName = 'allEntries';
  final createQuery;
  final darkMode;
  final toggleTheme;

  JournalEntries(
    {Key key, @required this.createQuery, this.darkMode, this.toggleTheme}
  );

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

  @override
  void didUpdateWidget(JournalEntries oldWidget) {
    print("inside of didUpdateWidget");
    super.didUpdateWidget(oldWidget);
    loadJournal();
  }

  goToNew(context, destination) {
    if (destination == 'newJournalEntry') {
      Navigator.pushNamed(context, 'newJournalEntry');
    }
  }

  void loadJournal() async {
    // first create database table if not already exists
    final Database database = await openDatabase('journal.sqlite3.db',
        version: 1, onCreate: (Database db, int version) async {
      await db.execute(widget.createQuery);
    });

    // generate a map of all database rows 
    List<Map> journalRecords =
      await database.rawQuery('SELECT * from journal_entries');

    // map over all records and return as an Entry, saving as List
    List<Entry> journalEntries = journalRecords.map((record) {
      return Entry(
          id: record['id'],
          title: record['title'],
          body: record['body'],
          rating: record['rating'],
          dateTime: DateTime.parse(record['dateTime']));
    }).toList();

    // update state with journal entries
    setState(() {
      journal = Journal(entries: journalEntries);
    });
  }

  // goes to a main journal entry page of a given id
  void goToFocusedEntry(context, destination, id) {
    if (destination == 'focusedEntry') {
      Navigator.pushNamed(context, 'focusedEntry',
        arguments: Entry(
          id: journal.getEntry(id).id,
          title: journal.getEntry(id).title,
          body: journal.getEntry(id).body,
          dateTime: journal.getEntry(id).dateTime,
          rating: journal.getEntry(id).rating
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // check first if journal is null to display a loading indicator
    if (journal == null) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator()],
        ),
      );
    } else {
      return JournalScaffold(
        darkMode: widget.darkMode, 
        toggleTheme: widget.toggleTheme,
        // conditionally display title based on if journal isEmpty
        title: journal.isEmpty ? 'Welcome' : 'All Entries',
        // conditionally display child widget based on if journal isEmpty
        childWidget: journal.isEmpty ? 
          Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              Text('Welcome to Dia Uno'),
              Icon(Icons.book, size: 72.0),
            ]
          ) : journalList(context)
      );
    }
  }

  // journalList widget that uses ListView to display all entires
  // returned from the database
  Widget journalList(BuildContext context) {
    return ListView.builder(
      itemCount: journal.numberOfEntries,
      itemBuilder: (context, index) {
        return ListTile(
          title: RichText(
            text: TextSpan(
              text: journal.getEntry(index).title,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          subtitle: Text(DateFormat('yMMMMEEEEd').format(
              DateTime.parse(journal.getEntry(index).dateTime.toString()))),
          onTap: () => goToFocusedEntry(
            context, 'focusedEntry', journal.getEntry(index).id - 1));
      }
    );
  }
}
