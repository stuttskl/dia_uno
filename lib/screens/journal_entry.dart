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
            RichText(
              text: TextSpan(
                text: args.title,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            RichText(
              text: TextSpan(
                text: args.body,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Rating: ' + args.rating.toString(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        )
      )
    );
  }
}
