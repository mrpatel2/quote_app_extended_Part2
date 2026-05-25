/* Mihir Patel
   CPSC 4150/6150
   Net Ninja Quote Lab Features 4 & 5 (Delete Confirmation and Category-Based Theme) 
   May 31, 2026
*/

import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() => runApp(const MaterialApp(home: QuoteList()));

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(
      author: 'Oscar Wilde',
      text: 'Be yourself; everyone else is already taken',
      category: 'Inspiration',
    ),
    Quote(
      author: 'Oscar Wilde',
      text: 'I have nothing to declare except my genius',
      category: 'Humor',
    ),
    Quote(
      author: 'Oscar Wilde',
      text: 'The truth is rarely pure and never simple',
      category: 'Truth',
    ),
    Quote(
      author: 'Socrates', 
      text: 'The only true wisdom is in knowing you know nothing', 
      category: 'Wisdom'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Awesome Quotes', 
          style: TextStyle(color: Colors.white), 
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: SingleChildScrollView( 
        child: Column(
          children: quotes
              .map((quote) => QuoteCard(
                    quote: quote,
                    delete: () {
                      setState(() {
                        quotes.remove(quote);
                      });
                    },
                    onLike: () {
                      setState(() {
                        quote.likes++;
                      });
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}