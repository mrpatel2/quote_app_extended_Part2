class Quote {
  String text;
  String author;
  String category;
  int likes;
  DateTime createdAt;

  Quote({
    required this.text,
    required this.author,
    this.category = 'General',
    this.likes = 0,
    DateTime? createdAt,                        // initially null
  }) : createdAt = createdAt ?? DateTime.now(); // Assign current time if null
}