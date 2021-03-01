import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'app.dart';

const DB_CREATE_QUERY = './assets/schema_1.sql.txt';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Directory documentsDir = await getApplicationDocumentsDirectory();
  // String documentsPath = documentsDir.path;

  // final File file = File('$documentsPath/example.txt');
  // await file.writeAsString("Important data here");

  String createQuery = await rootBundle.loadString(DB_CREATE_QUERY);
  // print('createQuery in main.dart:');
  // print(createQuery);
  // pass preferences down to App widget
  runApp(App(
      createQuery: createQuery,
      preferences: await SharedPreferences.getInstance()));
}
