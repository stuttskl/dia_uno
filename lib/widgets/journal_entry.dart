import 'package:flutter/material.dart';

class JournalEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Title'),
          Text('Body')
        ],
      )
    );
  }
}