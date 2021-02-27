import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/entry.dart';

class FocusedEntry extends StatelessWidget {
  static const routeName = 'focusedEntry';

  @override
  Widget build(BuildContext context) {
    // extracting args of type Entry using the build context
    final Entry args = ModalRoute.of(context).settings.arguments;
    // converting DateTime obj to string
    // String formattedDate = DateFormat.yMMMMEEEEd().format(args.date);

    return Scaffold(
      appBar: AppBar(title: Text("HEY THIS IS TEMP")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(args.title),
            Text(args.body),
            Text(args.rating.toString())
          ],
        )
      )
    );
  }
}