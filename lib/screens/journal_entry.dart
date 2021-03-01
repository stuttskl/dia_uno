import 'package:flutter/material.dart';
import '../models/entry.dart';
import 'package:intl/intl.dart';

class JournalEntry extends StatelessWidget {
  static const routeName = 'focusedEntry';
  final createQuery;

  JournalEntry({Key key, @required this.createQuery});

  @override
  Widget build(BuildContext context) {
    final Entry args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(DateFormat('yMMMMEEEEd')
                .format(DateTime.parse(args.dateTime.toString()))),),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Title: " + args.title),
            Text("Body: " + args.body),
            Text("Rating: " + args.rating.toString())
          ],
        )
      )
    );
  }
}
