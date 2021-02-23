import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/entry.dart';

class FocusedEntry extends StatelessWidget {
  static const routeName = 'focusedEntry';

  @override
  
  Widget build(BuildContext context) {
    final Entry args = ModalRoute.of(context).settings.arguments;

    String formattedDate = DateFormat.yMMMMEEEEd().format(args.date);

    return Scaffold(
      appBar: AppBar(title: Text(formattedDate)),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(args.title),
            Text(args.body)
          ],
        )
      )
    );
  }
}