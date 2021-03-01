class JournalEntryDTO {
  String title;
  String body;
  int rating;
  String dateTime;

  Map<String, dynamic> toMap() {
    return {'title': title, 'body': body, 'rating': rating, 'dateTime': dateTime};
  }
}
