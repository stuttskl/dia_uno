import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

import 'app.dart';

const DB_CREATE_QUERY = './assets/schema_1.sql.txt';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String createQuery = await rootBundle.loadString(DB_CREATE_QUERY);
  print(createQuery);
  // pass preferences down to App widget
  runApp(App(createQuery: createQuery, preferences: await SharedPreferences.getInstance()));
}
