import 'package:flutter/material.dart';

class ThemeToggle extends StatefulWidget {
  @override
  _ThemeToggleState createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Dark Mode'),
      value: _darkMode,
      onChanged: (bool value) {
        setState(() {
          _darkMode = true;
        });
      },
      secondary: const Icon(Icons.nightlight_round),
    );
  }
}
