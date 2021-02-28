import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/entry.dart';

class FocusedEntry extends StatelessWidget {
  static const routeName = 'focusedEntry';

  @override
  Widget build(BuildContext context) {
    // extracting args of type Entry using the build context
    final Entry args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(args.date)),
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