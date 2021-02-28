import 'package:dia_uno/screens/new_entry.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/home.dart';
import 'screens/new_entry.dart';
import 'screens/all_entries.dart';
import 'screens/focused_entry.dart';

class App extends StatefulWidget {
  // SharedPreferences object to store user preferences
  final SharedPreferences preferences;

  App({Key key, @required this.preferences}) : super(key: key);

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
      NewJournalEntry.routeName: (context) => NewJournalEntry(),
      FocusedEntry.routeName: (context) => FocusedEntry(),
      JournalEntries.routeName: (context) => JournalEntries()
    };

    return MaterialApp(
        routes: routes,
        title: 'Dia Uno',
        // home: list.length == 0 ? WelcomeScreen() : JournalEntries(),
        // pass the darkMode const and toggleTheme method to welcome screen
        // home: JournalEntries(),
        home: WelcomeScreen(darkMode: darkTheme, toggleTheme: toggleTheme),
        // teranary expression to set the theme based on if darkTheme has been set
        theme: darkTheme ? ThemeData.dark() : ThemeData.light());
  }

}
// TODO:
// [] only render welcome page if there are no journal entries
