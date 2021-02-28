import 'package:flutter/material.dart';
import '../widgets/drop_down_rating.dart';
import 'package:sqflite/sqflite.dart';

// data transfer object
class JournalEntryFields {
  String title;
  String body;
  int rating;
  String date;
  Map<String, dynamic> toMap() {
    return {'title': title, 'body': body, 'rating': rating, 'date': date};
  }
}

class JournalEntryForm extends StatefulWidget {
  @override
  _JournalEntryFormState createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  void addDateToJournalEntry() {
    journalEntryFields.date = "YYYY-MM-DD HH:MM:SS.SSS";
  }

  void saveEntry(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      addDateToJournalEntry();

      // await deleteDatabase('journal.sqlite3.db');
      // print("database deleted");

      Database database = await openDatabase('journal.sqlite3.db', version: 1,
          onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, body TEXT NOT NULL, rating INTEGER NOT NULL, date TEXT NOT NULL)');
      });

      // this works
      await database.insert(
        'journal_entries',
        journalEntryFields.toMap(),
      );

      // await database.transaction((txn) async {
      //   print(journalEntryFields.toMap());
      //   await txn.rawInsert(
      //       'INSERT INTO journal_entries(title, body, rating, date) VALUES(?, ?, ?, ?)',
      //       [journalEntryFields.toMap()]);
      // });

      await database.close(); // close db

      // print("valid, saving to database?");
      Navigator.of(context).pop(); // pop back to screen
    } else {
      print("invalid, not saving");
    }
  }

  void cancelEntry(BuildContext context) {
    // print("Cancel new entry");
    Navigator.of(context).pop();
  }

  final _formKey = GlobalKey<FormState>();
  final journalEntryFields = JournalEntryFields();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (value) {
                      // store value in some object
                      journalEntryFields.title = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Body',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 5,
                    onSaved: (value) {
                      // store value in some object
                      journalEntryFields.body = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some body text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  DropdownRatingFormField(
                    maxRating: 4,
                    onSaved: (value) {
                      // store objs
                      journalEntryFields.rating = value;
                    },
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  RaisedButton(
                    onPressed: () => saveEntry(context),
                    child: Text('Save'),
                  ),
                  RaisedButton(
                    onPressed: () => cancelEntry(context),
                    child: Text('Cancel'),
                  ),
                ])));
  }
}
