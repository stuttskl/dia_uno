import 'package:flutter/material.dart';
import '../models/entry.dart';

class JournalEntry extends StatelessWidget {
  static const routeName = 'focusedEntry';

  @override
  Widget build(BuildContext context) {
    final Entry args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text((DateTime.parse(args.dateTime.toString())).toString())),
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
