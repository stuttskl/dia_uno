import 'package:flutter/material.dart';

import './screens/welcome.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dia Uno',
      home: WelcomeScreen(),
      theme: ThemeData.dark()
    );
  }
}