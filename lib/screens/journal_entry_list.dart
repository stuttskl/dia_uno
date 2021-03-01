import 'package:dia_uno/main.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';


import '../models/entry.dart';
import '../models/journal.dart';
import '../widgets/all_entries_list.dart';
import '../widgets/journal_scaffold.dart';

class JournalEntries extends StatefulWidget {
  static const routeName = 'allEntries';
  final createQuery;
  final darkMode;
  final toggleTheme;

  JournalEntries(
      {Key key, @required this.createQuery, this.darkMode, this.toggleTheme});

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
    print('create query in journal_entry_list.dart: ');
    print(widget.createQuery);

    List<Entry> journalEntries = [
      Entry(
          id: 1,
          title: 'Mock Title 1',
          body: 'Mock Body 1',
          rating: 1,
          dateTime: DateTime.now()),
      Entry(
          id: 2,
          title: 'Mock Title 2',
          body: 'Mock Body 2',
          rating: 1,
          dateTime: DateTime.now()),
      Entry(
          id: 3,
          title: 'Mock Title 3',
          body: 'Mock Body 3',
          rating: 1,
          dateTime: DateTime.now()),
    ];

    // final Database database = await openDatabase('journal.sqlite3.db',
    //     version: 1, onCreate: (Database db, int version) async {
    //   await db.execute(widget.createQuery);
    // });

    // get all journal entries from database
    // List<Map> journalRecords =
    //     await database.rawQuery('SELECT * from journal_entries');

    // List<Entry> journalEntries = journalRecords.map((record) {
    //   return Entry(
    //       id: record['id'],
    //       title: record['title'],
    //       body: record['body'],
    //       rating: record['rating'],
    //       dateTime: DateTime.parse(record['dateTime']));
    // }).toList();

    setState(() {
      journal = Journal(entries: journalEntries);
    });
  }

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
    print(journal.isEmpty);
    // return JournalScaffold(
    //   title: 'Welcome',
    //   childWidget: Text('Welcome Child Widget'),
    // );
    return JournalScaffold(
        title: journal.isEmpty ? 'Welcome' : 'All Entries',
        childWidget:
            journal.isEmpty ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Welcome from Journal Scaffold'),
        Icon(Icons.book, size: 72.0),
       ]) : journalList(context));
  }

  Widget journalList(BuildContext context) {
    return ListView.builder(
        itemCount: journal.numberOfEntries,
        itemBuilder: (context, index) {
          return ListTile(
          title: 
            RichText(
                text: TextSpan(
                  text: journal.getEntry(index).title,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
          subtitle: Text(DateFormat('yMMMMEEEEd')
              .format(DateTime.parse(journal.getEntry(index).dateTime.toString()))),
          onTap: () => goToFocusedEntry(context, 'focusedEntry', journal.getEntry(index).id - 1)
        );
        });
  }

  // @override
  // Widget build(BuildContext context) {
  //   if (journal == null) {
  //     return Container(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [CircularProgressIndicator()],
  //       ),
  //     );
  //   } else {
  //     return Scaffold(
  //       appBar: AppBar(title: Text('All Entires')),
  //       body: LayoutBuilder(builder:
  //           (BuildContext context, BoxConstraints viewportConstraints) {
  //         return SingleChildScrollView(
  //             child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: <Widget>[
  //             AllEntriesList(list: journal.entries),
  //           ],
  //         ));
  //       }),
  //       floatingActionButton: FloatingActionButton(
  //         onPressed: () => goToNew(context, 'newJournalEntry'),
  //         tooltip: 'New Journal Entry',
  //         child: const Icon(Icons.add),
  //         backgroundColor: Colors.teal,
  //         focusColor: Colors.tealAccent,
  //       ),
  //     );
  //   }
  // }
}
