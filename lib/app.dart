import 'package:dia_uno/screens/new_journal_entry.dart';
import 'package:flutter/material.dart';

import './screens/welcome.dart';
import './screens/new_journal_entry.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routes = {
      NewJournalEntry.routeName: (context) => NewJournalEntry(),
    };

    return MaterialApp(
      routes: routes,
      title: 'Dia Uno',
      home: WelcomeScreen(),
      theme: ThemeData.dark()
    );
  }
}