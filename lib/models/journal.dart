import 'package:dia_uno/models/entry.dart';

class Journal {
  final List<Entry> entries;

  // Journal is a list of type Entry consisting of a list called entries... lol
  Journal({List<Entry> entries = const <Entry>[]}) : this.entries = entries;
}
