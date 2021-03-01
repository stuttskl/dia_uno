import 'package:flutter/material.dart';
import '../widgets/journal_entry_form.dart';

class NewJournalEntry extends StatefulWidget {
  static const routeName = 'newJournalEntry';
  final createQuery;

  NewJournalEntry({Key key, @required this.createQuery});
  @override
  _NewJournalEntryState createState() => _NewJournalEntryState();
}

class _NewJournalEntryState extends State<NewJournalEntry> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Journal Entry')),
      body: Center(
        child: 
          Column(
            children: [
              JournalEntryForm(createQuery: widget.createQuery)
            ]
          )
        )
      );
  }
}
