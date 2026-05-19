class Quote {

  String text;
  String author;
  String category;
  int likes;

  Quote({ 

    // added 'required' for text and author to satisfy Null safety
    required this.text, required this.author,
    this.category = 'General',
    this.likes = 0,
  });

}