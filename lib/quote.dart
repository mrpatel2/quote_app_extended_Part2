/* Mihir Patel
   CPSC 4150/6150
   Net Ninja Quote Lab Features 4 & 5 (Delete Confirmation and Category-Based Theme) 
   May 31, 2026
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
