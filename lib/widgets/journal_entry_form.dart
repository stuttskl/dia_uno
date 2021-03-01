import 'package:flutter/material.dart';
import '../widgets/drop_down_rating.dart';
import 'package:sqflite/sqflite.dart';
import '../db/journal_entry_dto.dart';

class JournalEntryForm extends StatefulWidget {
  @override
  _JournalEntryFormState createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  final _formKey = GlobalKey<FormState>();
  final journalEntryValues = JournalEntryDTO();
  String createQuery;

  void addDateToJournalEntryValues() {
    journalEntryValues.dateTime = DateTime.now().toIso8601String();
  }

  void saveEntry(BuildContext context) async {
    print('inside of saveEntry in journalEntryForm');
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      addDateToJournalEntryValues();

      //   // await deleteDatabase('journal.sqlite3.db');

      Database database = await openDatabase('journal.sqlite3.db', version: 1,
          onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, body TEXT NOT NULL, rating INTEGER NOT NULL, date TEXT NOT NULL);');
      });

      print("database created!?");

        await database.insert(
          'journal_entries',
          journalEntryValues.toMap(),
        );

        print('saving journal entry');
      await database.close(); // close db

      Navigator.of(context).pop();
    } else {
      print("invalid, not saving");
    }
  }

  void cancelEntry(BuildContext context) {
    Navigator.of(context).pop();
  }

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
                      journalEntryValues.title = value;
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
                      journalEntryValues.body = value;
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
                      journalEntryValues.rating = value;
                    },
                  ),
                  SizedBox(height: 40),
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
