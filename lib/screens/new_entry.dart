import 'package:flutter/material.dart';
import '../widgets/journal_entry_form.dart';

class NewJournalEntry extends StatefulWidget {
  static const routeName = 'newJournalEntry';
  @override
  _NewJournalEntryState createState() => _NewJournalEntryState();
}

class _NewJournalEntryState extends State<NewJournalEntry> {
   void saveList(BuildContext context) {
    print("Saving new list");
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Journal Entry')),
      body: Center(
        child: Column(
          children: [
            JournalEntryForm(),
            RaisedButton(
              onPressed: () => saveList(context),
              child: Text('Save'),
            ),
          ]
        )
      )
    );
  }
}