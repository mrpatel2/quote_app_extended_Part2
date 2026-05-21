/* Mihir Patel
   CPSC 4150/6150
   Net Ninja Quote Lab Features 1 (Category/Tag), 2 (Date Added), and 3 (Likes Counter) 
   May 24, 2026
*/

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
    DateTime? createdAt, // initially null
  }) : createdAt = createdAt ?? DateTime.now(); // Assign current time if null
}
