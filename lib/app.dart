import 'package:dia_uno/screens/new_entry.dart';
import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/new_entry.dart';
import 'screens/all_entries.dart';
import 'screens/focused_entry.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routes = {
      NewJournalEntry.routeName: (context) => NewJournalEntry(),
      FocusedEntry.routeName: (context) => FocusedEntry()
    };

    return MaterialApp(
      routes: routes,
      title: 'Dia Uno',
      // home: list.length == 0 ? WelcomeScreen() : JournalEntries(),
      home: JournalEntries(),
      theme: ThemeData.dark()
    );
  }
}