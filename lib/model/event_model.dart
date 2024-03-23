class Event {
  final String title;
  final DateTime date;
  final String imageUrl;
  final String? description;
  bool isFlipped;
  bool isPastEvent;
  bool register = false;

  Event(
      {required this.title,
      required this.date,
      required this.imageUrl,
      this.description,
      this.isPastEvent = false})
      : isFlipped = false;
}
