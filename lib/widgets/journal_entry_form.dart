import 'package:flutter/material.dart';

class JournalEntryForm extends StatefulWidget {
  @override
  _JournalEntryFormState createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  void saveEntry(BuildContext context) {
    print("Save new entry");
    Navigator.of(context).pop();
  }

  void cancelEntry(BuildContext context) {
    print("Cancel new entry");
    Navigator.of(context).pop();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
          ),
          TextFormField(
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'Body',
              border: OutlineInputBorder(),
            ),
          ),
          TextFormField(
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'Rating',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          InputDatePickerFormField(
            autofocus: true,
            firstDate: DateTime.now(),
            lastDate: DateTime.now(),
            
          ),
          RaisedButton(
            onPressed: () => saveEntry(context),
            child: Text('Save'),
          ),
          RaisedButton(
            onPressed: () => cancelEntry(context),
            child: Text('Cancel'),
          ),
        ]
      )
    );
  }
}