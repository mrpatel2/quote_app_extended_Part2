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
  bool _isConfirmingDelete = false;

  // feature 5: category theme logic
  Color _getThemeColor() {
    switch (widget.quote.category) {
      case 'Inspiration': return Colors.green.shade700;
      case 'Humor': return Colors.orange.shade800;
      case 'Truth': return Colors.purple.shade700;
      case 'Wisdom': return Colors.teal.shade700;
      default: return Colors.blue.shade700;
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
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(widget.quote.text, style: TextStyle(fontSize: 18.0, color: Colors.grey[800])),
            const SizedBox(height: 6.0),
            Text('- ${widget.quote.author}', style: TextStyle(fontSize: 14.0, color: themeColor, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8.0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Chip(
                      label: Text(widget.quote.category, style: const TextStyle(color: Colors.white)),
                      backgroundColor: themeColor, // category theme
                    ),
                    Text(DateFormat('MMM d, yyyy').format(widget.quote.createdAt), style: TextStyle(color: Colors.grey[800], fontSize: 12.0)),
                  ],
                ),
                Row(
                  children: [
                    Text('${widget.quote.likes}', style: TextStyle(fontSize: 16.0, color: themeColor)),
                    IconButton(icon: const Icon(Icons.thumb_up), color: themeColor, onPressed: widget.onLike),
                    // feature 4: Local state variable for delete confirmation
                    if (_isConfirmingDelete)
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.check_circle, color: Colors.red),
                            onPressed: widget.delete, // Actually deletes it
                          ),
                          IconButton(
                            icon: const Icon(Icons.cancel, color: Colors.grey),
                            onPressed: () => setState(() => _isConfirmingDelete = false), // Cancels deleting
                          ),
                        ],
                      )
                    else
                      TextButton.icon(
                        onPressed: () => setState(() => _isConfirmingDelete = true), 
                        label: const Text('delete'),
                        icon: const Icon(Icons.delete),
                        style: TextButton.styleFrom(foregroundColor: Colors.red),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}