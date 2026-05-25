import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'quote.dart';

class QuoteCard extends StatefulWidget {
  final Quote quote;
  final VoidCallback delete;
  final VoidCallback onLike;

  const QuoteCard({super.key, required this.quote, required this.delete, required this.onLike});

  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  // feature 4: Local state variable for delete confirmation
  bool _isConfirmingDelete = false;

  // feature 4: category theme logic
  Color _getThemeColor() {
    switch (widget.quote.category) {
      case 'Inspiration': return Colors.green;
      case 'Humor': return Colors.orange;
      case 'Truth': return Colors.purple;
      case 'Wisdom': return Colors.teal;
      default: return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color themeColor = _getThemeColor();

    return Card(
      color: themeColor.withOpacity(0.05), 
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: themeColor.withOpacity(0.5), width: 1), 
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text('Logic Added!'),
      ),
    );
  }
}