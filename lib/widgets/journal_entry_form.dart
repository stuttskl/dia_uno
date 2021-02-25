import 'package:flutter/material.dart';

class JournalEntryForm extends StatefulWidget {
  @override
  _JournalEntryFormState createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  void saveEntry(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print("valid, saving");
      Navigator.of(context).pop();

    }
    print("invalid, not saving");
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
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
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
              onSaved: (value) {
                // store value in some object
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Rating',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onSaved: (value) {
                // store value in some object
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            InputDatePickerFormField(
              autofocus: true,
              firstDate: DateTime.now(),
              lastDate: DateTime.now(),
            ),
            SizedBox(height: 20),
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
      )
    );
  }
}