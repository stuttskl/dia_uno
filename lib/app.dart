import 'package:dia_uno/screens/new_entry.dart';
import 'package:dia_uno/widgets/journal_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/home.dart';
import 'screens/new_entry.dart';
import 'screens/journal_entry_list.dart';
import 'screens/journal_entry.dart';

class App extends StatefulWidget {
  // SharedPreferences object to store user preferences
  final SharedPreferences preferences;
  final String createQuery;

  App({Key key, @required this.preferences, this.createQuery})
      : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // constant to store darkTheme key
  static const DARK_THEME = 'darkTheme';

  // get the current widget preferences, defaulting to false via the null detector
  // if no setting has been set
  bool get darkTheme => widget.preferences.getBool(DARK_THEME) ?? false;

  // toggles the boolean value for darkMode true/false
  void toggleTheme(bool value) {
    setState(() {
      widget.preferences.setBool(DARK_THEME, !darkTheme);
    });
  }

  @override
  Widget build(BuildContext context) {
    var routes = {
      NewJournalEntry.routeName: (context) => NewJournalEntry(createQuery: widget.createQuery),
      JournalEntry.routeName: (context) => JournalEntry(createQuery: widget.createQuery),
      JournalEntries.routeName: (context) =>
      JournalEntries(createQuery: widget.createQuery),
    };

    return MaterialApp(
      routes: routes,
      title: 'Dia Uno',
      home: JournalEntries(createQuery: 'hi', darkMode: darkTheme, toggleTheme: toggleTheme),
      // home: JournalScaffold(darkMode: darkTheme, toggleTheme: toggleTheme),
      theme: darkTheme ? ThemeData.dark() : ThemeData.light());
  }
}
