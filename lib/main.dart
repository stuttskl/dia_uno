import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


import 'app.dart';

const DB_CREATE_QUERY = './assets/schema_1.sql.txt';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await deleteDatabase('journal.sqlite3.db');

  String createQuery = await rootBundle.loadString(DB_CREATE_QUERY);

  // pass preferences down to App widget
  runApp(
    App(
      createQuery: createQuery,
      preferences: await SharedPreferences.getInstance()
    )
  );
}
