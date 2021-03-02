import 'package:dia_uno/models/entry.dart';

class Journal {
  final List<Entry> entries;

  int get numberOfEntries => entries.length;
  bool get isEmpty => entries.isEmpty;

  // returns an instance of an entry for a specified index
  Entry getEntry(int index) {
    return entries[index];
  }

  // Journal is a list of type Entry consisting of a list called entries... lol
  Journal({List<Entry> entries = const <Entry>[]}) : this.entries = entries;
}
